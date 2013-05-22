$:.unshift File.expand_path("../../lib", __FILE__)

require 'minitest/spec/expect'
require 'minitest/autorun'

describe Kernel do
  describe '#expect' do
    it 'requires something to be passed to it' do
      ->{ expect }.must_raise ArgumentError, 'must pass an argument or a block'
    end
  end
end
