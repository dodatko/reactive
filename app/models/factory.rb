class DumbFactory

  def self.contacts n = 2
    names = ['bbbbbb', 'aaaaa', 'cccccccccccc']
    contacts = []
    names.each do |name|
      contact = Contact.new :name => name

      messages = []
      5.times do |i|
        message = Message.new(
          :sender   => "Test message #{i.to_s}",
          :sent     => "#{i.to_s}/#{i.to_s}/#{i.to_s}",
          :subject  => "This is a message #{i.to_s} subject",
          :body     => "This is a text for message #{i.to_s}. " * 5,
          :read_flag => false
        )
        message.addObserver(contact,
          forKeyPath:'read_flag',
          options:NSKeyValueObservingOptionNew,
          context:'read_flag')
        messages << message
      end
      contact.messages = messages
      contacts << contact
    end

    contacts
  end

end