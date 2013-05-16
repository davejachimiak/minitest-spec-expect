# minitest-spec-expect
...adds the expect syntax for minitest. It was made out of love for Rspec2's expect syntax and
Minitest's lightweight feel.
## Install
In your Gemfile:
```ruby
gem 'minitest-spec-expect'
```
or install it:
```
$ gem install minitest-spec-expect
```
## Usage
Wrap the object under test in an `expect()` object. Then call a minitest expectation on it,
substituting `must` with `to` and `wont` with `to_not`.

For example:
```ruby
describe Integer do
  describe '#+' do
    it 'adds numbers correctly' do
      expect(1 + 1).to_equal 2
    end

    it 'does not add numbers incorrectly' do
      expect(1 + 1).to_not_equal 3
    end
  end
end
```
### Examples
```ruby
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
    expect(/(fart)*/).to_match 'fartfartfartfart'
  end

  it 'supports wont_match as to_not_match' do
    expect(/fart/).to_not_match 'barf'
  end

  it 'supports must_output as to_output' do
    expect(->{ puts 'barf' }).to_output "barf\n"
  end

  it 'supports must_raise as to_raise' do
    expect(->{ raise RuntimeError }).to_raise RuntimeError
  end

  it 'supports must_respond_to as to_respond_to' do
    expect(Object.new).to_respond_to :must_respond_to
  end

  it 'supports wont_respond_to as to_not_respond_to' do
    expect(Object.new).to_not_respond_to :fart_factory
  end

  it 'supports must_throw as to_throw' do
    expect(->{ throw StandardError }).to_throw StandardError
  end
end
```

## Contribute
## License
The MIT License (MIT)

Copyright (c) 2013 Dave Jachimiak

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
