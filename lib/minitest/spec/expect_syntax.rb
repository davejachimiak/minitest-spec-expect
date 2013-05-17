class MiniTest::Spec::ExpectSyntax
  TRANSPOSITIONS = {'must' => 'to', 'wont' => 'to_not'}

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
    MiniTest::Expectations.instance_methods
  end

  def set_expectation expectation_name
    expect_class.class_eval <<-EOM
      #{expect_method expectation_name }
    EOM
  end

  def expect_method expectation_name
    """
      def #{expect_method_name expectation_name } *args
        #{expect_class::OBJECT}.#{expectation_name} *args
      end
    """
  end

  def expect_method_name expectation_name
    TRANSPOSITIONS.inject('') do |memo, transposition|
      string = memo.empty? ? expectation_name.to_s : memo

      string.gsub transposition.first, transposition.last
    end
  end
end
