class Minitest::Spec::ExpectSyntax
  TRANSPOSITIONS       = { 'must' => 'to', 'wont' => 'to_not' }
  TRANSPOSITION_REGEXP = Regexp.union TRANSPOSITIONS.keys

  def initialize expect_class
    @expect_class = expect_class
  end

  def set_expectations
    expectation_names.each do |expectation_name|
      set_expectation expectation_name
    end
  end

  private

  def expectation_names
    raise NotImplementedError
  end

  def expectations_instance_methods
    Minitest::Expectations.instance_methods
  end

  def set_expectation expectation_name
    @expect_class.class_eval <<-CODE
      #{expect_method expectation_name }
    CODE
  end

  def expect_method expectation_name
    """
      def #{expect_method_name expectation_name.to_s } *args
        #{@expect_class::OBJECT_UNDER_TEST}.#{expectation_name} *args
      end
    """
  end

  def expect_method_name expectation_name
    expectation_name.gsub TRANSPOSITION_REGEXP, TRANSPOSITIONS
  end
end
