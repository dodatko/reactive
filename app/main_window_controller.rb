class MessagesWindow < NSWindowController
  extend IB

  ACTION_BUTTONS = [:add, :remove, :info]

  outlet :messagesController, NSArrayController

  attr_accessor :messages

  def windowDidLoad
    @messages = Message.generateDumb 100500
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

end
