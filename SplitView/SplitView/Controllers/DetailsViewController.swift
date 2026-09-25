//
//  DetailsViewController.swift
//  SplitView
//
//  Created by Szabolcs Tóth on 17.09.2026.
//

import Cocoa

class DetailsViewController: NSViewController {

    // Private Properties
    private let label: NSTextField = {
        let label = NSTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 44))
        label.backgroundColor = .white
        label.isBezeled = false
        label.isEditable = false
        return label
    }()

    // Properties
    let model: AppModel

    init(model: AppModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        model.onChange = { [weak self] in self?.updateLabel() }
    }

    override func loadView() {
        self.view = NSView()
        // Size of the view
        view.frame.size = CGSize(width: 280, height: 270)
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.cgColor

        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        let labelConstraint = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        NSLayoutConstraint.activate(labelConstraint)

        self.updateLabel()
    }

    private func updateLabel() {
        label.stringValue =
            "Hello, \(model.selectedName.count == 0 ? "World" : model.selectedName)!"
        label.sizeToFit()
    }

}
