//
//  MainWindowController.swift
//  NoStoryboard
//
//  Created by Szabolcs Tóth on 17.09.2026.
//

import Cocoa

class MainWindowController: NSWindowController {

    let toolbarDelegate = SimpleToolbarDelegate()

    convenience init() {
        self.init(windowNibName: "")
    }

    override func loadWindow() {
        let contentSize = NSSize(width: 480, height: 270)
        let window = MainWindow(
            contentRect: NSRect(origin: .zero, size: contentSize),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: true
        )
        window.title = "Hello"
        window.titlebarAppearsTransparent = true
        window.contentViewController = MainViewController()
        window.setContentSize(contentSize)
        self.window = window
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        let toolbar = NSToolbar(identifier: "hu.purzelbaum.Toolbar")
        toolbar.delegate = toolbarDelegate
        window?.toolbar = toolbar
        window?.center()
    }
    
}
