class MessagesWindow < NSWindowController
  extend IB

  # outlet :button, NSButton
  # outlet :message_table, NSTableView

  outlet :messagesController, NSArrayController
  attr_accessor :messages
  attr_accessor :selected

  def windowDidLoad
    @messages = Message.generateDumb 3
    @selected = []
    @messagesController.content = @messages
  end

  def add_new_message sender
    @messagesController.addObject Message.generateDumb
  end

  def inspect sender
    p messagesController.selectedObjects.inspect
    p @selected.inspect
  end

end
