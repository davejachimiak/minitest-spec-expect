require 'minitest/spec/expect_syntax'

class Minitest::Spec::ExpectSyntaxForBlock < Minitest::Spec::ExpectSyntax
  BLOCK_PASSING_EXPECTATION_REGEXES = [/silent/, /output/, /raise/, /throw/]

  private

  def expectation_names
    expectations_instance_methods.select do |method|
      detect_block_passing_expectation method
    end
  end

  def detect_block_passing_expectation method
    BLOCK_PASSING_EXPECTATION_REGEXES.detect { |regex| regex.match method }
  end
end
