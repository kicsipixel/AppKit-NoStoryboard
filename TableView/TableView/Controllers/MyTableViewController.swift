//
//  MyTableViewController.swift
//  TableView
//
//  Created by Szabolcs Tóth on 18.09.2026.
//

import Cocoa

final class MyTableViewController: NSViewController {

    private let tableView = NSTableView()

    override func loadView() {

        // Name column
        let tableColumn1 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("nameColumn"))
        tableColumn1.title = "Name"
        tableColumn1.minWidth = 100
        tableColumn1.resizingMask = [.autoresizingMask, .userResizingMask]

        // Age column
        let tableColumn2 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("ageColumn"))
        tableColumn2.title = "Age"
        tableColumn2.minWidth = 50
        tableColumn2.resizingMask = [.autoresizingMask, .userResizingMask]

        tableView.addTableColumn(tableColumn1)
        tableView.addTableColumn(tableColumn2)

        tableView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        tableView.usesAlternatingRowBackgroundColors = true
        tableView.rowHeight = 30
        tableView.dataSource = self
        tableView.delegate = self

        let scrollView = NSScrollView()
        scrollView.documentView = tableView
        scrollView.hasVerticalScroller = true
        view = scrollView
    }
}

// MARK: - NSTableViewDataSource

extension MyTableViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        Person.testData.count
    }
}

// MARK: - NSTableViewDelegate

extension MyTableViewController: NSTableViewDelegate {
    func tableView(
        _ tableView: NSTableView,
        viewFor tableColumn: NSTableColumn?,
        row: Int
    ) -> NSView? {
        guard let tableColumn = tableColumn else { return nil }

        let person = Person.testData[row]
        let cellIdentifier = tableColumn.identifier
        let cellView: NSTableCellView

        if cellIdentifier == NSUserInterfaceItemIdentifier("nameColumn") {
            cellView =
                tableView.makeView(withIdentifier: cellIdentifier, owner: self)
                as? TextCellViewWithImage
                ?? TextCellViewWithImage(identifier: cellIdentifier)

            cellView.textField?.stringValue = person.name

        } else {
            cellView =
                tableView.makeView(withIdentifier: cellIdentifier, owner: self)
                as? DefaultTextCellView
                ?? DefaultTextCellView(identifier: cellIdentifier)

            cellView.textField?.stringValue = "\(person.age)"
        }

        return cellView
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow >= 0 else { return }
        print("Selected: \(Person.testData[tableView.selectedRow].name)")
    }

}
