module Kernel
  def expect arg=null_expect_arg, &block
    raise_errors arg, block

    MiniTest::Spec::Expect.new block || arg
  end

  private

  def null_expect_arg
    @null_expect_arg ||= NullExpectArg.new
  end

  def raise_errors arg, block
    if arg.is_a?(NullExpectArg) && !block
      raise ArgumentError, 'must pass an argument or a block'
    end
  end

  class NullExpectArg; end;
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
