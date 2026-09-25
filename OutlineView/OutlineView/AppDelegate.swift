//
//  AppDelegate.swift
//  OutlineView
//
//  Created by Szabolcs Tóth on 17.09.2026.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var mainWindowController = MainWindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        mainWindowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {}

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}
