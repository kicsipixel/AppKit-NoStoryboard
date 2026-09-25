# HelloWorld - No Storyboard
A window with a toolbar and a centered "Hello, World!" label, built without Storyboard.

![](helloworld.png)

## What's inside
- `AppDelegate` – creates and shows the `MainWindowController`
- `MainWindowController` – builds the `MainWindow` in `loadWindow()` and adds the toolbar
- `MainViewController` – builds its view in `loadView()` and centers the label with Auto Layout
- `SimpleToolbarDelegate` – provides a single Share button

## Key points
- `init(windowNibName: "")` + overriding `loadWindow()` replaces the Storyboard
- `loadView()` creates the view in code instead of loading a nib

## Read more
[NSWindow without Storyboard](https://medium.com/@kicsipixel/nswindow-without-storyboard-42921ad9a366)
