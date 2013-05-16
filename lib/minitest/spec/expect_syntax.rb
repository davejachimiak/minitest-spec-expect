require 'minitest/spec'

module Minitest
  class Spec
    class ExpectSyntax
      TRANSPOSITIONS = {'must' => 'to', 'wont' => 'to_not'}
      INTERESTING_AUXILIARY_VERB_REGEXES = [/must/, /wont/]

      attr_reader :expect_class

      def initialize expect_class
        @expect_class = expect_class
      end

      def set_expectations
        spec_expectation_names.each do |spec_expectation_name|
          set_expectation spec_expectation_name
        end
      end

      private

      def spec_expectation_names
        Object.instance_methods.select { |method_name| expectation? method_name }
      end

      def expectation? method_name
        !!INTERESTING_AUXILIARY_VERB_REGEXES.detect do |regex|
          method_name.to_s.match regex
        end
      end

      def set_expectation expectation_name
        expect_class.class_eval <<-EOM
          #{expect_method expectation_name }
        EOM
      end

      def expect_method expectation_name
        """
          def #{expect_method_name expectation_name } *args
            #{expect_class::OBJECT}.#{expectation_name} *args
          end
        """
      end

      def expect_method_name expectation_name
        TRANSPOSITIONS.inject('') do |memo, transposition|
          string = memo.empty? ? expectation_name.to_s : memo

          string.gsub transposition.first, transposition.last
        end
      end
    end
  end
end

