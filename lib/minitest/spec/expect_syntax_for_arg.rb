require 'minitest/spec/expect_syntax'

class Minitest::Spec::ExpectSyntaxForArg < Minitest::Spec::ExpectSyntax
  private

  def expectation_names
    expectations_instance_methods
  end
end
