//
//  TextCellViewWithImage.swift
//  TableView
//
//  Created by Szabolcs Tóth on 18.09.2026.
//

import Cocoa

final class TextCellViewWithImage: NSTableCellView {

    private let iconView: NSImageView = {
        let config = NSImage.SymbolConfiguration(pointSize: 16, weight: .regular)
        let image = NSImage(systemSymbolName: "person.crop.circle", accessibilityDescription: nil)?
            .withSymbolConfiguration(config)

        let view = NSImageView(image: image ?? NSImage())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.symbolConfiguration = config
        return view
    }()

    private let label: NSTextField = {
        let label = NSTextField(labelWithString: "")
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(identifier: NSUserInterfaceItemIdentifier) {
        super.init(frame: .zero)
        self.identifier = identifier

        addSubview(label)
        addSubview(iconView)
        textField = label
        imageView = iconView

        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 18),
            iconView.heightAnchor.constraint(equalToConstant: 18),

            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 6),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) is not supported") }
}
