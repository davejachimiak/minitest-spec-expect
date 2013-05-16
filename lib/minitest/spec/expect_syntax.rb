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

      def set_assertions
        assertion_names.each do |assertion_name|
          set_assertion_on_expect_class assertion_name
        end
      end

      private

      def assertion_names
        Object.instance_methods.select { |method_name| assertion? method_name }
      end

      def assertion? method_name
        !!INTERESTING_AUXILIARY_VERB_REGEXES.detect do |regex|
          method_name.to_s.match regex
        end
      end

      def set_assertion_on_expect_class assertion_name
        expect_class.class_eval <<-EOM
          #{expect_method assertion_name }
        EOM
      end

      def expect_method assertion_name
        """
          def #{expect_method_name assertion_name } *args
            #{expect_class::OBJECT}.#{assertion_name} *args
          end
        """
      end

      def expect_method_name assertion_name
        TRANSPOSITIONS.inject('') do |memo, transposition|
          string = memo.empty? ? assertion_name.to_s : memo

          string.gsub transposition.first, transposition.last
        end
      end
    end
  end
end

