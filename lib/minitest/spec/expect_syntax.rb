class MiniTest::Spec::ExpectSyntax
  TRANSPOSITIONS = { 'must' => 'to', 'wont' => 'to_not' }
  TRANSPOSITION_REGEXP = Regexp.union TRANSPOSITIONS.keys

  attr_reader :expect_class

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

  def set_expectation expectation_name
    expect_class.class_eval <<-EOM
      #{expect_method expectation_name }
    EOM
  end

  def expect_method expectation_name
    """
      def #{expect_method_name expectation_name } *args
        #{expect_class::OBJECT_UNDER_TEST}.#{expectation_name} *args
      end
    """
  end

  def expect_method_name expectation_name
    expectation_name.to_s.gsub TRANSPOSITION_REGEXP, TRANSPOSITIONS
  end
end
