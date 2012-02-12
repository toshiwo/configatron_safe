class Configatron
  class UndefinedParameterError < StandardError
    def intialize(name)
      super("Undefined parameter: '#{name}'")
    end
  end
end
