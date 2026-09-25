//
//  MainViewController.swift
//  HelloWorld
//
//  Created by Szabolcs Tóth on 17.09.2026.
//

import Cocoa

class MainViewController: NSViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
    }

    override func loadView() {
        super.viewDidLoad()
        self.view = NSView()
        // Size of the view, we create the same size as our window
        view.frame.size = CGSize(width: 480, height: 270)
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.cgColor

        // Text field with "Hello, World!"
        let label = NSTextField()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        label.stringValue = "Hello, World!"
        label.backgroundColor = .white
        label.isBezeled = false
        label.isEditable = false
        label.sizeToFit()
        view.addSubview(label)

        // Constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelConstraint = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        NSLayoutConstraint.activate(labelConstraint)
    }

}
