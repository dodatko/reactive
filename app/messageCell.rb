class MessageCell < NSTableCellView
  extend IB

  outlet :sender,   NSTextField
  outlet :subject,  NSTextField
  outlet :sent,     NSTextField
  outlet :body,     NSTextFieldCell
end