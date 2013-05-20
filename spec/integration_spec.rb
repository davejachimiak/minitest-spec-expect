$:.unshift File.expand_path("../../lib", __FILE__)

require 'minitest/spec/expect'
require 'minitest/autorun'

describe 'expect syntax' do
  it 'supports must_be as to_be' do
    expect(1).to_be :<, 2
  end

  it 'supports wont_be as to_not_be' do
    expect(1).to_not_be :>, 2
  end

  it 'supports must_be_close_to as to_be_close_to (within_delta)' do
    expect(Math::PI).to_be_close_to 22.0/7.0, 0.01
    expect(Math::PI).to_be_within_delta 22.0/7.0, 0.01
  end

  it 'supports wont_be_close_to as to_not_be_close_to (within_delta)' do
    expect(Math::PI).to_not_be_close_to 22.0/6.0, 0.01
    expect(Math::PI).to_not_be_within_delta 22.0/6.0, 0.01
  end

  it 'supports must_be_empty as to_be_empty' do
    expect([]).to_be_empty
  end

  it 'supports wont_be_empty as to_not_be_empty' do
    expect({awwyeah: :minitest}).to_not_be_empty
  end

  it 'supports must_be_instance_of as to_be_instance_of' do
    expect([]).to_be_instance_of Array
  end

  it 'supports wont_be_instance_of as to_not_be_instance_of' do
    expect([]).to_not_be_instance_of Hash
  end

  it 'supports must_be_kind_of as to_be_kind_of' do
    expect([]).to_be_kind_of Enumerable
  end

  it 'supports wont_be_kind_of as to_not_be_kind_of' do
    expect([]).to_not_be_kind_of NilClass
  end

  it 'supports must_be_nil as to_be_nil' do
    expect(nil).to_be_nil
  end

  it 'supports wont_be_nil as to_not_be_nil' do
    expect(:something).to_not_be_nil
  end

  it 'supports must_be_same_as as to_be_same_as' do
    expect(obj = Object.new).to_be_same_as obj
  end

  it 'supports wont_be_same_as as to_not_be_same_as' do
    object_one = Object.new

    expect(Object.new).to_not_be_same_as object_one
  end

  it 'supports must_be_silent as to_be_silent' do
    expect { '' }.to_be_silent
    expect(->{''}).to_be_silent
  end

  it 'supports must_be_within_epsilon as to_be_within_epsilon' do
    expect(4).to_be_within_epsilon 3.5, 0.15
  end

  it 'supports wont_be_within_epsilon as to_not_be_within_epsilon' do
    expect(4).to_not_be_within_epsilon 3.5, 0.11
  end

  it 'supports must_equal as to_equal' do
    expect('4d3d3d3d').to_equal '4d3d3d3d'
  end

  it 'supports wont_equal as to_not_equal' do
    expect('4d3d3d3d').to_not_equal 'tayne'
  end

  it 'supports must_include as to_include' do
    expect(['tim', 'eric']).to_include 'eric'
  end

  it 'supports wont_include as to_not_include' do
    expect(['tim', 'eric']).to_not_include 'brule'
  end

  it 'supports must_match as to_match' do
    expect('fartfartfartfart').to_match /(fart)*/
  end

  it 'supports wont_match as to_not_match' do
    expect('bart').to_not_match /fart/
  end

  it 'supports must_output as to_output' do
    expect { puts 'barf' }.to_output "barf\n"
    expect(->{ puts 'barf' }).to_output "barf\n"
  end

  it 'supports must_raise as to_raise' do
    expect { raise RuntimeError }.to_raise RuntimeError
    expect(->{ raise RuntimeError }).to_raise RuntimeError
  end

  it 'supports must_respond_to as to_respond_to' do
    expect(Object.new).to_respond_to :must_respond_to
  end

  it 'supports wont_respond_to as to_not_respond_to' do
    expect(Object.new).to_not_respond_to :fart_factory
  end

  it 'supports must_throw as to_throw' do
    expect { throw StandardError }.to_throw StandardError
    expect(->{ throw StandardError }).to_throw StandardError
  end
end
