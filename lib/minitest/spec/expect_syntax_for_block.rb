require 'minitest/spec/expect_syntax'

class MiniTest::Spec::ExpectSyntaxForBlock < MiniTest::Spec::ExpectSyntax
  BLOCK_YIELDING_EXPECTATION_REGEXES = [/silent/, /output/, /raise/, /throw/]

  private

  def expectation_names
    MiniTest::Expectations.instance_methods.select do |method|
      detect_block_yielding_expectation method
    end
  end

  def detect_block_yielding_expectation method
    BLOCK_YIELDING_EXPECTATION_REGEXES.detect do |regex|
      method.to_s.match regex
    end
  end
end
