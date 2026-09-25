//
//  MainOutlineViewController.swift
//  OutlineView
//
//  Created by Szabolcs Tóth on 25.09.2026.
//

import Cocoa

class MainOutlineViewController: NSViewController {

    private let outlineView = NSOutlineView()
    private let rootItems = SampleData.rootItems

    override func loadView() {

        // Name column
        let nameColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("nameColumn"))
        nameColumn.title = "Name"
        nameColumn.minWidth = 100
        nameColumn.resizingMask = [.autoresizingMask, .userResizingMask]

        outlineView.addTableColumn(nameColumn)
        // The column that shows the disclosure triangles
        outlineView.outlineTableColumn = nameColumn

        outlineView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        outlineView.usesAlternatingRowBackgroundColors = true
        outlineView.intercellSpacing = NSSize(width: 3, height: 2)
        outlineView.indentationPerLevel = 15  // Visual indentation
        //        outlineView.headerView = nil
        outlineView.rowHeight = 24
        outlineView.dataSource = self
        outlineView.delegate = self

        let scrollView = NSScrollView()
        scrollView.documentView = outlineView
        scrollView.hasVerticalScroller = true
        view = scrollView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        outlineView.reloadData()
        outlineView.expandItem(nil, expandChildren: true)  // Expand all by default
    }
}

// MARK: - NSOutlineViewDataSource
extension MainOutlineViewController: NSOutlineViewDataSource {
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        guard let item else { return rootItems.count }
        return (item as? Group)?.children.count ?? 0
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let group = item as? Group { return group.children[index] }
        return rootItems[index]
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        item is Group
    }
}

// MARK: - NSOutlineViewDelegate
extension MainOutlineViewController: NSOutlineViewDelegate {
    func outlineView(
        _ outlineView: NSOutlineView,
        viewFor tableColumn: NSTableColumn?,
        item: Any
    ) -> NSView? {
        guard let tableColumn = tableColumn, let item = item as? Attributes else { return nil }

        let cellIdentifier = tableColumn.identifier
        let cellView: NSTableCellView =
            outlineView.makeView(withIdentifier: cellIdentifier, owner: self)
            as? DefaultTextCellView
            ?? DefaultTextCellView(identifier: cellIdentifier)

        cellView.textField?.stringValue = item.name

        return cellView
    }

    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard let item = outlineView.item(atRow: outlineView.selectedRow) as? Attributes
        else { return }
        print("Selected: \(item.name)")
    }
}
