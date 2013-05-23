require 'minitest/spec/expect_syntax'

class MiniTest::Spec::ExpectSyntaxForBlock < MiniTest::Spec::ExpectSyntax
  BLOCK_PASSING_EXPECTATION_REGEXES = [/silent/, /output/, /raise/, /throw/]

  private

  def expectation_names
    MiniTest::Expectations.instance_methods.select do |method|
      detect_block_passing_expectation method
    end
  end

  def detect_block_passing_expectation method
    BLOCK_PASSING_EXPECTATION_REGEXES.detect do |regex|
      regex.match method
    end
  end
end
