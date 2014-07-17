class MessagesWindow < NSWindowController
  extend IB

  outlet :my_button, NSButton

  def windowDidLoad
    @button.bordered = false
    @button.cell.backgroundColor = NSColor.redColor
  end

  def foo123(sender)
    puts 'bar!'
  end
end
