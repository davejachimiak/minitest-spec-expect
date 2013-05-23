module Kernel
  def expect arg=null_expect_arg, &block
    raise_errors arg, block
    MiniTest::Spec::Expect.create arg, &block
  end

  private

  def null_expect_arg
    NullExpectArg.new
  end

  def raise_errors object, block
    if object.is_a?(NullExpectArg) && block.nil?
      raise ArgumentError, 'must pass an argument or a block'
    end

    if !object.is_a?(NullExpectArg) && block
      raise ArgumentError, 'cannot handle both an argument and a block'
    end
  end

  class NullExpectArg; end;
end

require 'minitest/spec'

class MiniTest::Spec::Expect
  OBJECT_UNDER_TEST = 'object'

  attr_reader OBJECT_UNDER_TEST

  class_eval <<-EOM
    def initialize #{OBJECT_UNDER_TEST}
      @#{OBJECT_UNDER_TEST} = #{OBJECT_UNDER_TEST}
    end
  EOM

  def self.create arg, &block
    block ? ForBlock.new(block) : ForArg.new(arg)
  end

  class ForArg < self
    require 'minitest/spec/expect_syntax_for_arg'
    MiniTest::Spec::ExpectSyntaxForArg.new(self).set_expectations
  end

  class ForBlock < self
    require 'minitest/spec/expect_syntax_for_block'
    MiniTest::Spec::ExpectSyntaxForBlock.new(self).set_expectations
  end
end
