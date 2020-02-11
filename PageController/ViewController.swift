//
//  ViewController.swift
//  PageController
//
//  Created by tsuyoshi on 2020/02/10.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    var item: String = "" {
        didSet {
            self.textView.string = item
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

