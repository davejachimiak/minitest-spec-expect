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
## Contribute
## License
