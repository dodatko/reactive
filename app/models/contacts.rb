class Contact

  attr_accessor :name, :messages

  def initialize args
    args.each { |k,v| self.instance_variable_set("@#{k}".to_sym, v) }
  end

  def self.generateDumb n = 1
    contacts = []
    n.times do |i|
      contacts << Contact.new(
        :name => 'Name Of Sender',
        :messages => Message.generateDumb(15)
      )
    end
    n > 1 ? contacts : contacts.first
  end

end
