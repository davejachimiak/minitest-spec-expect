$:.unshift File.expand_path("../../lib", __FILE__)

require 'minitest/spec/expect/autorun'

describe Kernel do
  describe '#expect' do
    it 'explodes if nothing is passed to it' do
      ->{ expect }.must_raise ArgumentError, 'must pass an argument or a block'
    end

    it 'explodes if both an arg and a block passed to it' do
      ->{ expect(:straw_man) { :cinder } }.
        must_raise ArgumentError, 'cannot handle both an argument and a block'
    end

    describe 'when a block is passed' do
      before do
        expectations              = Minitest::Expectations.instance_methods
        block_expectation_regexes = [/silent/, /output/, /raise/, /throw/]

        non_block_expectations = expectations.reject do |method|
          block_expectation_regexes.detect do |regex|
            method.to_s.match regex
          end
        end

        transpositions = { 'must' => 'to', 'wont' => 'to_not' }

        @non_block_expect_methods = non_block_expectations.map do |expectation|
          transpositions.inject('') do |memo, transposition|
            string = memo.empty? ? expectation.to_s : memo

            string.gsub transposition.first, transposition.last
          end.to_sym
        end
      end

      it "won't respond to non-block-passing expectations" do
        @non_block_expect_methods.each do |method|
          expect { :muscular_son }.wont_respond_to method
        end
      end
    end
  end
end
