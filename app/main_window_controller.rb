class MessagesWindow < NSWindowController
  extend IB

  ACTION_BUTTONS = [:add, :remove, :info]

  outlet :messagesController, NSArrayController
  outlet :contactsController, NSArrayController

  attr_accessor :contacts

  def windowDidLoad
    @contacts = Contact.generateDumb 15
    @contactsController.content = @contacts

    @messages = Message.generateDumb 15
    @messagesController.content = @messages
  end

  def action sender
    send ACTION_BUTTONS[sender.selectedSegment]
  end

  def add
    @messagesController.addObject Message.generateDumb
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
    @messagesController.selectedObjects.each { |m| m.read_flag = true }
  end

end
