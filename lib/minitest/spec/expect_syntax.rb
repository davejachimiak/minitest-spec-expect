class Minitest::Spec::ExpectSyntax
  TRANSPOSITIONS = {'must' => 'to', 'wont' => 'to_not'}
  INTERESTING_AUXILIARY_VERB_REGEXES = [/must/, /wont/]

  attr_reader :expect

  def initialize expect
    @expect = expect
  end

  def set_assertions
    interesting_assertions.each { |assertion| set_assertion assertion }
  end

  private

  def interesting_assertions
    Object.instance_methods.select { |method| detect_assertion method }
  end

  def detect_assertion method
    INTERESTING_AUXILIARY_VERB_REGEXES.detect { |regex| method.to_s.match regex }
  end

  def set_assertion assertion
    expect.class_eval <<-EOM
      def #{method_name assertion } *args
        #{expect::OBJECT}.#{assertion} *args
      end
    EOM
  end

  def method_name assertion
    TRANSPOSITIONS.inject('') do |memo, transposition|
      string = memo.empty? ? assertion.to_s : memo

      string.gsub transposition.first, transposition.last
    end
  end
end

