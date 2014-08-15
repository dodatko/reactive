class MessagesWindow < NSWindowController
  extend IB

  ACTION_BUTTONS = [:add, :remove, :info]

  outlet :messagesController, NSArrayController
  outlet :contactsController, NSArrayController

  attr_accessor :contacts

  def windowDidLoad
    @contacts = DumbFactory.contacts
    @contactsController.content = @contacts
  end

  def action sender
    send ACTION_BUTTONS[sender.selectedSegment]
  end

  def add
    @messagesController.addObject Message.new(
      :sender   => "Test message",
      :sent     => "11/10/2014",
      :subject  => "This is a subject",
      :body     => "This is a text for message. " * 5,
      :read_flag => false
    )
    # @messagesController.insertObject(
    #   Message.generateDumb,
    #   atArrangedObjectIndex:@messagesController.selectionIndex + 1)
  end

  def remove
    @messagesController.removeObjectsAtArrangedObjectIndexes @messagesController.selectionIndexes
  end

  def info
    p 'info ' + @messagesController.selectedObjects.inspect
  end

  def tableViewSelectionDidChange notification
    mark_as_read nil
  end

  def mark_as_unread sender
    @messagesController.selectedObjects.each { |m| m.read_flag = false }
  end

  def mark_as_read sender
    @messagesController.selectedObjects.each { |m| m.read_flag = true }
  end


end
