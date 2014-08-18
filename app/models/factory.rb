class DumbFactory

  def self.contacts n = 2
    names = ['Михаил Биленко', 'Сергей Качан', 'Андрей Шрамко', 'Алиса Кондратьева', 'Слава Додатко']
    contacts = []
    names.each do |name|
      contact = Contact.new :name => name

      messages = []
      
      5.times do |i|
        message = Message.new(
          :sender   => names[Random.rand(names.count)],
          :sent     => DumbFactory.random_date(3),
          :subject  => "In favour of #{names[Random.rand(names.count)]}",
          :body     => "Hello #{names[Random.rand(names.count)]}! " + "This is a text for message #{i.to_s}. " * 5,
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
  
  def self.random_date(days)
    Time.new - rand(days * 24 * 60 * 60)
  end

end
