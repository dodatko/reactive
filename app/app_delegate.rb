class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
  end

  def buildWindow
    @mainWindowController = MainWindow.alloc.initWithWindowNibName('Messages')
    @mainWindowController.window.makeKeyAndOrderFront(self)
  end
end
