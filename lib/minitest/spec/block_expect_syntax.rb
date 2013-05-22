require 'minitest/spec/expect_syntax'

class MiniTest::Spec::BlockExpectSyntax < MiniTest::Spec::ExpectSyntax
  private

  def expectation_names
    MiniTest::Expectations.instance_methods.select do |method|
      [/silent/, /output/, /raise/, /throw/].detect do |regex|
        method.to_s.match regex
      end
    end
  end
end
