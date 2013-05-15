module Kernel
  def expect object
    Minitest::Spec::Expect.new object
  end
end

class Minitest::Spec::Expect
  SPEC_METHOD_REGEXES = [/must/, /wont/]

  attr_reader :object, :viral_methods

  def initialize object, options={}
    options = default_options.merge options

    @object        = object
    @viral_methods = options[:viral_methods]

    infect_expectations
  end

  private

  def default_options
    { viral_methods: default_viral_methods }
  end

  def default_viral_methods
    Object.instance_methods.select do |method|
      SPEC_METHOD_REGEXES.detect { |regex| method.to_s.match regex }
    end
  end

  def infect_expectations
    viral_methods.each { |viral_method| infect_expectation viral_method }
  end

  def infect_expectation viral_method
    method_name = viral_method.to_s.gsub 'must', 'to'

    instance_eval <<-EOM
      def #{method_name} *args
        object.#{viral_method} *args
      end
    EOM
  end
end
