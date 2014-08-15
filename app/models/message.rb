class Message

  attr_accessor :sender, :sent, :subject, :body, :read_flag

  def initialize args
    args.each { |k,v| self.instance_variable_set("@#{k}".to_sym, v) }
  end
  
  def self.generateDumb n = 1
    messages = []
    n.times do |i|
      messages << Message.new(
        :sender   => "Test message #{i.to_s}",
        :sent     => "#{i.to_s}/#{i.to_s}/#{i.to_s}",
        :subject  => "This is a message #{i.to_s} subject",
        :body     => "This is a text for message #{i.to_s}. " * 5,
        :read_flag => false
      )
    end
    n > 1 ? messages : messages.first
  end
  
  # def read_flag=value
  #   willChangeValueForKey 'read_flag'
  #   p 'read flag'
  #   @read_flag = value
  #   didChangeValueForKey 'read_flag'
  # end

end
