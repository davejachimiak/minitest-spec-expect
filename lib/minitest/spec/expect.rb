module Kernel
  NO_ARG = Object.new

  def expect arg=NO_ARG, &block
    raise_errors arg, block
    Minitest::Spec::Expect.create arg, &block
  end

  private

  def raise_errors object, block
    if object == NO_ARG
      raise ArgumentError, 'must pass an argument or a block' if !block
    else
      raise ArgumentError, 'cannot handle both an argument and a block' if block
    end
  end
end

require 'minitest/autorun'

class Minitest::Spec::Expect
  OBJECT_UNDER_TEST = :object_under_test

  attr_reader OBJECT_UNDER_TEST

  def initialize object_under_test
    @object_under_test = object_under_test
  end

  def self.create arg, &block
    block ? ForBlock.new(block) : ForArg.new(arg)
  end

  class ForArg < self
    require 'minitest/spec/expect_syntax_for_arg'
    Minitest::Spec::ExpectSyntaxForArg.new(self).set_expectations
  end

  class ForBlock < self
    require 'minitest/spec/expect_syntax_for_block'
    Minitest::Spec::ExpectSyntaxForBlock.new(self).set_expectations
  end
end
