# minitest-spec-expect
Expect syntax for minitest. It was made out of love for Rspec2's expect syntax and
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
substituting `must` and `wont` with `to` and `to_not`.

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
That's equivalent to:
```ruby
describe Integer do
  describe '#+' do
    it 'adds numbers correctly' do
      (1 + 1).must_equal 2
    end

    it 'does not add numbers incorrectly' do
      (1 + 1).wont_equal 3
    end
  end
end
```
## API
Please see [the minitest expectation and assertion docs]() for more details on implementations
for the `must` and `wont` methods transposed to `to` and `to_not` methods transposed here.
### `#*be`
```ruby
expect(1).to_be :<, 2
expect(1).to_not_be :>, 2
```
### `#*be_close_to/#*be_within_delta`
```ruby
expect(Math::PI).to_be_close_to 22.0/7.0, 0.01
expect(Math::PI).to_be_within_delta 22.0/7.0, 0.01
expect(Math::PI).to_not_be_close_to 22.0/6.0, 0.01
expect(Math::PI).to_not_be_within_delta 22.0/6.0, 0.01
```
### `#*be_empty`
```ruby
expect([]).to_be_empty
expect({awwyeah: :minitest}).to_not_be_empty
```
### `#*be_instance_of`
```ruby
expect([]).to_be_instance_of Array
expect([]).to_not_be_instance_of Hash
```
### `#*be_kind_of`
```ruby
expect([]).to_be_kind_of Enumerable
expect([]).to_not_be_kind_of NilClass
```
### `#*be_nil`
```ruby
expect(nil).to_be_nil
expect(:something).to_not_be_nil
```
### `#*be_same_as`
```ruby
expect(obj = Object.new).to_be_same_as obj
an_object = Object.new
expect(Object.new).to_not_be_same_as an_object
```
### `#to_be_silent`
(availble with Minitest 5.0)
```ruby
expect(->{''}).to_be_silent
```
### `#*be_within_epsilon`
```ruby
expect(4).to_be_within_epsilon 3.5, 0.15
expect(4).to_not_be_within_epsilon 3.5, 0.11
```
### `#*equal`
```ruby
expect('4d3d3d3d').to_equal '4d3d3d3d'
expect('4d3d3d3d').to_not_equal 'tayne'
```
### `#*include`
```ruby
expect(['tim', 'eric']).to_include 'eric'
expect(['tim', 'eric']).to_not_include 'brule'
```
### `#*match`
```ruby
expect(/(fart)*/).to_match 'fartfartfartfart'
expect(/fart/).to_not_match 'barf'
```
### `#to_output`
(availble with Minitest 5.0)
```ruby
expect(->{ puts 'barf' }).to_output "barf\n"
```
### `#to_raise`
```ruby
expect(->{ raise RuntimeError }).to_raise RuntimeError
```
### `#*respond_to`
```ruby
expect(Object.new).to_respond_to :must_respond_to
expect(Object.new).to_not_respond_to :fart_factory
```
### `#*throw`
```ruby
expect(->{ throw StandardError }).to_throw StandardError
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
