require 'minitest/spec'
require_relative 'expect_syntax'

module Kernel
  def expect object
    Minitest::Spec::Expect.new object
  end
end

class Minitest::Spec::Expect
  OBJECT = 'object'

  attr_reader OBJECT.to_sym

  def initialize object
    @object = object
  end

  Minitest::Spec::ExpectSyntax.new(self).set_assertions
end
