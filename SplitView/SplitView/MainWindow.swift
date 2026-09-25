//
//  MainWindow.swift
//  NoStoryboard
//
//  Created by Szabolcs Tóth on 17.09.2026.
//

import Cocoa

class MainWindow: NSWindow {

    override init(
        contentRect: NSRect,
        styleMask style: NSWindow.StyleMask,
        backing backingStoreType: NSWindow.BackingStoreType,
        defer flag: Bool
    ) {
        super.init(
            contentRect: contentRect,
            styleMask: style,
            backing: backingStoreType,
            defer: flag
        )
        isMovableByWindowBackground = true
    }

}
