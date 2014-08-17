class Contact < Base

  attr_accessor :name, :messages
  attr_reader :unread_messages_count

  def unread_messages_count
    # p "unread_messages_count"
    @messages.select{|m| !m.read_flag }.count
  end

  def observeValueForKeyPath(keyPath, ofObject:object, change:change, context:context)
    NSLog("read_flag change notification: #{keyPath} #{context.inspect}")
    # force reread "unread_messages_count"
    willChangeValueForKey "unread_messages_count"
    didChangeValueForKey "unread_messages_count"
  end
  
  # def keyPathsForValuesAffectingValueForKey
  #
  # end

end
