module Minitest
  class Spec
  end
end

require 'minitest/autorun'
require_relative '../../../lib/minitest/spec/expect_syntax'

describe Minitest::Spec::ExpectSyntax do
  describe '#set_assertions' do
    before do
      Object.send(:define_method, 'must_chew') { 'yum' }
      Object.send(:define_method, 'wont_chew') { 'puke' }
      @expect = Class.new
      @expect.send(:define_method, :the_object_in_question) { Object.new }
      @expect::OBJECT = 'the_object_in_question'
      @expect_syntax = Minitest::Spec::ExpectSyntax.new @expect

      @expect_syntax.set_assertions
    end

    it 'sets "must" with "to" assertions on the class passed in' do
      @expect.new.to_chew.must_equal 'yum'
    end

    it 'sets "wont" with "to_not" assertions on the class passed in' do
      @expect.new.to_not_chew.must_equal 'puke'
    end
  end
end
