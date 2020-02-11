//
//  WindowController.swift
//  PageController
//
//  Created by tsuyoshi on 2020/02/10.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.window?.setFrame(NSRect(x: 50, y: 600, width: 320, height: 240), display: true)
    }

}
