class MessagesWindow < NSWindowController
  extend IB

  outlet :button, NSButton
  outlet :message_table, NSTableView

  def windowDidLoad
    @messages = Message.generateDumbData(100)
    
    @message_table.delegate = self
    @message_table.dataSource = self
    @message_table.reloadData #important
  end

  def foo123(sender)
    puts 'bar!'
  end
  
  def numberOfRowsInTableView(table_view)
    @messages.count
  end

  # def tableView(table_view, objectValueForTableColumn:table_column, row:row)
  #   p 'getting data for row ' + row.to_s
  #   'Row ' + row.to_s
  # end

  # Table View Delegates
  def tableView(table_view, heightOfRow:row)
    100
  end

  def tableView(tableView, viewForTableColumn:tableColumn, row:row)
    # p 'creating cell for row ' + row.to_s
    
    @cell_identifier ||= "message-cell"
    cellView = tableView.makeViewWithIdentifier(@cell_identifier, owner:self)
    # p 'getting data for row ' + row.to_s
    message = @messages[row]
    p message.sender
    cellView.sender.stringValue = message.sender
    cellView.subject.stringValue = message.subject
    cellView.sent.stringValue = message.sent
    cellView.body.stringValue = message.body
    
    return cellView
  end
  
end

