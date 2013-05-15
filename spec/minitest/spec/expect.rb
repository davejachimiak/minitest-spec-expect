require 'minitest/autorun'

module Minitest
  class Spec
  end
end

class Object
  self.class_eval <<-EOM
    def must_poop
      'poop'
    end

    def wont_poop
      'fart'
    end
  EOM
end

require_relative '../../../lib/minitest/spec/expect'

describe 'integration' do
  describe 'instance methods' do
    before do
      @object = Object.new
    end

    describe 'positive' do
      it 'replace "must" methods to "to"' do
        expect = Minitest::Spec::Expect.new @object

        expect.to_poop.must_equal 'poop'
      end
    end

    describe 'negative' do
      it 'replace "wont" methods to "to_not"' do
        expect = Minitest::Spec::Expect.new @object

        expect.to_not_poop.must_equal 'fart'
      end
    end
  end
end
