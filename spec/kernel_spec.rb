$:.unshift File.expand_path("../../lib", __FILE__)

require 'minitest/spec/expect'
require 'minitest/autorun'

describe Kernel do
  describe '#expect' do
    it 'explodes if nothing is passed to it' do
      ->{ expect }.must_raise ArgumentError, 'must pass an argument or a block'
    end

    describe 'when a block is passed' do
      before do
        expectations              = MiniTest::Expectations.instance_methods
        block_expectation_regexes = [/silent/, /output/, /raise/, /throw/]

        @non_block_expectations = expectations.reject do |method|
          block_expectation_regexes.detect do |regex|
            method.to_s.match regex
          end
        end
      end

      it 'explodes if an arg is passed to it, too' do
        ->{ expect(:svu) { :ice_t } }.
          must_raise ArgumentError, 'cannot handle both an argument and a block'
      end

      it "won't respond to non-block calling expectations" do
        @non_block_expectations.each do |expectation|
          method = expectation.to_s.gsub('must', 'to').gsub('wont', 'to_not').to_sym

          expect { '' }.wont_respond_to method
        end
      end
    end
  end
end
