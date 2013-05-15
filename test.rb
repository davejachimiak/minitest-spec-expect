old_instance_methods = Object.instance_methods

require 'minitest/spec'

$infected_assertions = Object.instance_methods - old_instance_methods

module Kernel
  def expect object
    Expect.new object
  end
end

class Expect
  attr_reader :object

  def initialize object
    @object = object
  end

  $infected_assertions.each do |assertion|
    method = assertion.to_s.gsub('must', 'to').gsub 'wont', 'to_not'

    self.class_eval <<-EOM
      def #{method} *args
        object.#{assertion} *args
      end
    EOM
  end
end

require 'minitest/autorun'

describe 'forty two' do
  before { @forty_two = 42 }

  it 'equals 42' do
    expect(@forty_two).to_equal 42
  end

  it 'is less than 43' do
    expect(@forty_two).to_be :<, 43
  end

  it 'is not more than 43' do
    expect(@forty_two).not_to_be :>, 43
  end

  it 'is a fixnum' do
    expect(@forty_two).to_be_instance_of Fixnum
  end

  it 'is a kind of integer' do
    expect(@forty_two).to_be_kind_of Integer
  end

  it 'is not a kind of float' do
    expect(@forty_two).to_not_be_kind_of Float
  end
end
