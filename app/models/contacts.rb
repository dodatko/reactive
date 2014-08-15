class Contact

  attr_accessor :name, :messages

  def initialize args
    args.each { |k,v| self.instance_variable_set("@#{k}".to_sym, v) }
  end

  def self.generateDumb n = 1
    contacts = []
    n.times do |i|
      contact = Contact.new(
        :name => 'Name Of Sender',
        :messages => Message.generateDumb(15)
      )
      contact.addObserver(self,
        forKeyPath:'read_flag',
        options:NSKeyValueObservingOptionNew,
        context:nil)
        
      contacts << contact
      
    end
    n > 1 ? contacts : contacts.first
  end
  
  def observeValueForKeyPath(keyPath, ofObject:object, change:change, context:context)
    NSLog("read_flag change notification: #{keyPath} #{object.inspect}")
  end
  
  def unread_messages_count
    # p "unread_messages_count"
    @messages.select{|m| m.read_flag }.count
  end
  
end
