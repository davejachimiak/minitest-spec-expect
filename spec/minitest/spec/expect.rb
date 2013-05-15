module Minitest
  class Spec
  end
end

require_relative '../../../lib/minitest/spec/expect'
require 'minitest/autorun'

describe Minitest::Spec::Expect do
  describe 'instance methods' do
    describe 'positive' do
      it 'replace "must" methods to "to"' do
        object = Object.new
        object.instance_eval <<-EOM
          def must_poop
            'poop'
          end
        EOM

        expect = Minitest::Spec::Expect.new object, { viral_methods: [:must_poop] }

        expect.to_poop.must_equal 'poop'
      end
    end
  end
end
