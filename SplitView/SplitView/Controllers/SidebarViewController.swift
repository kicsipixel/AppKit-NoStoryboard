//
//  SidebarViewController.swift
//  SplitView
//
//  Created by Szabolcs Tóth on 21.09.2026.
//

import Cocoa

class SidebarViewController: NSViewController {

    // Private Propertie
    private let tableView: NSTableView = {
        let tableView = NSTableView()
        let tableColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("nameColumn"))
        tableColumn.title = "Name"
        tableColumn.minWidth = 100
        tableColumn.resizingMask = [.autoresizingMask, .userResizingMask]

        tableView.addTableColumn(tableColumn)
        tableView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        tableView.usesAlternatingRowBackgroundColors = true
        tableView.rowHeight = 30
        return tableView
    }()

    private let people = Person.testData

    // Properties
    let model: AppModel

    // Initializer
    init(model: AppModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func loadView() {
        let root = NSView()

        let scrollView = NSScrollView()
        scrollView.documentView = tableView
        scrollView.hasVerticalScroller = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        root.addSubview(scrollView)

        // Scroll view
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: root.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: root.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: root.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: root.trailingAnchor),
        ])

        self.view = root
    }

}

extension SidebarViewController: NSTableViewDataSource, NSTableViewDelegate {

    func numberOfRows(in tableView: NSTableView) -> Int {
        self.people.count
    }

    func tableView(
        _ tableView: NSTableView,
        viewFor tableColumn: NSTableColumn?,
        row: Int
    ) -> NSView? {

        let cellIdentifier = NSUserInterfaceItemIdentifier("Name")
        let cellView: NSTableCellView =
            tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? DefaultTextCellView
            ?? DefaultTextCellView(identifier: cellIdentifier)

        cellView.textField?.stringValue = people[row].name

        return cellView
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        let selected = tableView.selectedRow
        if selected >= 0 {
            model.selectedName = self.people[selected].name
        }
    }
}
