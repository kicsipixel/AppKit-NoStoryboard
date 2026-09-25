//
//  AppModel.swift
//  SplitView
//
//  Created by Szabolcs Tóth on 22.09.2026.
//

import Foundation

class AppModel {
    var selectedName = "" {
        didSet {
            onChange?()
        }
    }

    var onChange: (() -> Void)?
}
