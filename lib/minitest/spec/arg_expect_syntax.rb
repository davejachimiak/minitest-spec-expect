require 'minitest/spec/expect_syntax'

class MiniTest::Spec::ExpectSyntaxForArg < MiniTest::Spec::ExpectSyntax
  private

  def expectation_names
    MiniTest::Expectations.instance_methods
  end
end
