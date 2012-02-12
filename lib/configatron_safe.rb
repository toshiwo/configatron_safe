require "configatron"
require "configatron_safe/version"

module ConfigatronSafe
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods
    def self.extended(base)
    end
  end

  module InstanceMethods
    def self.included(base)
      base.send :alias_method, :method_missing_without_safe, :method_missing
      base.send :alias_method, :method_missing, :method_missing_with_safe
    end

    def safe_mode?
      (@safe_mode == true)
    end

    def safe!
      @_store.each do |namespace, value|
        value.safe! if value.is_a? Configatron::Store
      end

      @safe_mode = true
    end

    def unsafe!
      @_store.each do |namespace, value|
        value.unsafe! if value.is_a? Configatron::Store
      end

      @safe_mode = false
    end

    def method_missing_with_safe(sym, *args)
      method = (sym == :method_missing ? args.first : sym)
      arg = args.last

      if safe_mode? and !@_store.has_key?(sym)
        raise Configatron::UndefinedParameterError.new sym.to_s
      else
        method_missing_without_safe method, arg
      end
    end
    private :method_missing_with_safe

  end
end

require "configatron_safe/configatron"
