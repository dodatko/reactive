class MessagesWindow < NSWindowController
  extend IB

  outlet :button, NSButton
  outlet :messages, NSTableView

  def windowDidLoad
    @button.bordered = false
    @button.cell.backgroundColor = NSColor.redColor

    @messages.delegate = self
    @messages.dataSource = self
    @messages.reloadData #important
  end

  def foo123(sender)
    puts 'bar!'
  end
  
  def numberOfRowsInTableView(table_view)
    100500
  end

  def tableView(table_view, objectValueForTableColumn:table_column, row:row)
    p 'getting data for row ' + row.to_s
    'Row ' + row.to_s
  end

  # Table View Delegates
  def tableView(table_view, heightOfRow:row)
    50
  end

  def tableView(table_view, viewForTableColumn:tableColumn, row:row)
    # p 'creating cell for row ' + row.to_s
    
    @cell_identifier ||= "regular-cell"

    nstextfield_view = table_view.makeViewWithIdentifier(@cell_identifier, owner:self)

    if nstextfield_view.nil?
      nstextfield_view = NSTextField.alloc.initWithFrame CGRectZero
      nstextfield_view.identifier = @cell_identifier
    end

    return nstextfield_view
  end
  
end
