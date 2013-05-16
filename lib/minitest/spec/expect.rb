module Kernel
  def expect object
    MiniTest::Spec::Expect.new object
  end
end

require 'minitest/spec'

class MiniTest::Spec::Expect
  require 'minitest/spec/expect_syntax'

  OBJECT = 'object'

  attr_reader OBJECT.to_sym

  def initialize object
    @object = object
  end

  MiniTest::Spec::ExpectSyntax.new(self).set_expectations
end
