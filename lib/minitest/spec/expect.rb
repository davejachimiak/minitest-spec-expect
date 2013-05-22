module Kernel
  def expect arg=null_expect_arg, &block
    raise_errors arg, block

    if block_given?
      MiniTest::Spec::ExpectForBlock.new block
    else
      MiniTest::Spec::ExpectForArg.new arg
    end
  end

  private

  def null_expect_arg
    @null_expect_arg ||= NullExpectArg.new
  end

  def raise_errors arg, block
    if arg.is_a?(NullExpectArg) && block.nil?
      raise ArgumentError, 'must pass an argument or a block'
    end

    if !arg.is_a?(NullExpectArg) && block
      raise ArgumentError, 'cannot handle both an argument and a block'
    end
  end

  class NullExpectArg; end;
end

require 'minitest/spec'

class MiniTest::Spec::Expect
  OBJECT = 'object'

  attr_reader OBJECT.to_sym

  def initialize object
    @object = object
  end
end

class MiniTest::Spec::ExpectForArg < MiniTest::Spec::Expect
  require 'minitest/spec/arg_expect_syntax'

  MiniTest::Spec::ExpectSyntaxForArg.new(self).set_expectations
end

class MiniTest::Spec::ExpectForBlock < MiniTest::Spec::Expect
  require 'minitest/spec/block_expect_syntax'

  MiniTest::Spec::ExpectSyntaxForBlock.new(self).set_expectations
end
