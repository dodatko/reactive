class Base

  def initialize args
    args.each { |k,v| self.instance_variable_set("@#{k}".to_sym, v) }
  end

end
