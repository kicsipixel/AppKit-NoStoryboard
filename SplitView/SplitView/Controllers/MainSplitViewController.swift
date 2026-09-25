//
//  MainSplitViewController.swift
//  SplitView
//
//  Created by Szabolcs Tóth on 21.09.2026.
//

import Cocoa

class MainSplitViewController: NSSplitViewController {

    let model = AppModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        let sideItem = NSSplitViewItem(
            sidebarWithViewController: SidebarViewController(model: model))
        let detailsItem = NSSplitViewItem(viewController: DetailsViewController(model: model))

        splitView.isVertical = true

        addSplitViewItem(sideItem)
        addSplitViewItem(detailsItem)
    }

}
