class MessagesWindow < NSWindowController
  extend IB

  outlet :messagesController, NSArrayController
  outlet :tableScrollView, NSScrollView

  attr_accessor :messages
  attr_accessor :selected

  def windowDidLoad
    @messages = Message.generateDumb 100
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
  
  def segment_button sender
    p sender.selectedSegment.inspect
  end

end
