# TableView - No Storyboard
An `NSTableView` with two columns inside an `NSScrollView`, built without Storyboard.

![](nstableview.png)

## What's inside
- `MyTableViewController` – creates the columns and the table, acts as data source and delegate
- `DefaultTextCellView` – `NSTableCellView` with an `NSTextField` (Age column)
- `TextCellViewWithImage` – `NSTableCellView` with an `NSImageView` and an `NSTextField` (Name column)
- `Person` – model with test data

## Key points
- `NSTableViewDataSource` – how many rows: `numberOfRows(in:)`
- `NSTableViewDelegate` – what each cell shows: `tableView(_:viewFor:row:)`
- Selected row: `tableViewSelectionDidChange(_:)`

## Read more
[Mastering NSTableView](https://www.swiftyn.com/learn/macos/mastering-nstableview-data-display-macos)
