class Message < Base

  attr_accessor :id, :sender, :sent, :subject, :body, :read_flag
  
  def subject
    p "asked for message #{@id}"
    @subject
  end

end
