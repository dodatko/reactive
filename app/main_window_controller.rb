class MessagesWindow < NSWindowController
  extend IB

  ACTION_BUTTONS = [:add, :remove, :info]

  outlet :messagesController, NSArrayController
  outlet :contactsController, NSArrayController
  outlet :contactsTable, NSTableView
  
  attr_accessor :contacts

  def windowDidLoad
    @contacts = DumbFactory.contacts
    @contactsController.content = @contacts
    @contactsTable.setSortDescriptors [NSSortDescriptor.sortDescriptorWithKey('unread_messages_count', ascending:1)]
  end

  def action sender
    send ACTION_BUTTONS[sender.selectedSegment]
  end

  def add
    @messagesController.addObject Message.new(
      :sender   => "Test message",
      :sent     => "21/08/2014",
      :subject  => "This is a subject",
      :body     => "This is a text for message. " * 5,
      :read_flag => false)
  end

  def remove
    @messagesController.removeObjectsAtArrangedObjectIndexes @messagesController.selectionIndexes
  end

  def info
    p 'selectedObjects ' + @messagesController.selectedObjects.inspect
  end

  def tableViewSelectionDidChange notification
    # mark_as_read nil
  end

  def mark_as_unread sender
    @messagesController.selectedObjects.each { |m| m.read_flag = false }
  end

  def mark_as_read sender
    @messagesController.selectedObjects.each { |m| m.read_flag = true }
  end
  
  def mark_as_read_last_contact sender
    p 'need to mark as read all messages of last contact'
    @contactsController.arrangedObjects.last.messages.each { |m| m.read_flag = true }
  end


end
