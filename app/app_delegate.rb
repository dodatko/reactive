class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
  end

  def buildWindow
    @main = MessagesWindow.alloc.initWithWindowNibName('Messages')
    
    # p '-------------------- ' + @main.window.inspect
    # # @main.makeKeyAndOrderFront(self)
    @main.window
  end
end
