//
//  SimpleToolbarDelegate.swift
//  HelloWorld
//
//  Created by Szabolcs Tóth on 17.09.2026.
//

import Cocoa

final class SimpleToolbarDelegate: NSObject, NSToolbarDelegate {

    static let shareIdentifier = NSToolbarItem.Identifier("hu.purzelbaum.Share")

    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [.flexibleSpace, Self.shareIdentifier]
    }

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        toolbarDefaultItemIdentifiers(toolbar)
    }

    func toolbar(
        _ toolbar: NSToolbar,
        itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
        willBeInsertedIntoToolbar flag: Bool
    ) -> NSToolbarItem? {

        guard itemIdentifier == Self.shareIdentifier else { return nil }

        let item = NSToolbarItem(itemIdentifier: itemIdentifier)
        item.image = NSImage(
            systemSymbolName: "square.and.arrow.up",
            accessibilityDescription: "Share"
        )
        item.label = ""
        item.paletteLabel = "Share"
        item.toolTip = "Share with others"
        item.action = #selector(share(_:))
        item.target = self
        item.isBordered = true
        return item
    }

    @objc private func share(_ sender: Any?) {
        print("It has been pressed...")
    }

}
