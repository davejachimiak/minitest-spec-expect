module Kernel
  def expect object=NullExpectArg.new, &block
    if object.is_a?(NullExpectArg) && !block
      raise ArgumentError, 'must pass an argument or a block'
    end

    MiniTest::Spec::Expect.new block || object
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
