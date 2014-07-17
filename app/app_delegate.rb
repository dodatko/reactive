class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
  end

  def buildWindow
    @main = MessagesWindow.alloc.initWithWindowNibName('Messages')
    @main.window.makeKeyAndOrderFront(self)
  end
end
