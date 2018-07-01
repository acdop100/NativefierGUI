//
//  ViewController.swift
//  Nativefier GUI
//
//  Created by Alex Lehman on 6/28/18.
//  Copyright © 2018 Alex Lehman. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let process = Process()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var maximized: NSButton!
    @IBOutlet weak var security: NSButton!
    @IBOutlet weak var extraMenus: NSButton!
    
    
    let command1 = "nativefier"
    var command2 = ""
    var command3 = ""
    var command4 = ""

    
    @IBOutlet weak var Website: NSTextField!
    @IBOutlet weak var customFlags: NSTextField!
    
    @IBAction func Nativefy(_ sender: Any) {
        
        var site = Website.stringValue
        var flags = customFlags.stringValue
        
        var state1 = maximized.state
        var state2 = security.state
        var state3 = extraMenus.state
        
        if state1 == .on {
            var command2 = "--maximize"
        }
        
        if state2 == .on {
            var command3 = "--ignore-certificate --insecure"
        }
        
        if state3 == .on {
            var command4 = "--disable-context-menu --disable-dev-tools"
        }
        
        
        process.launchPath = "/usr/bin/env"
        process.arguments = [command1, command2, command3, command4, site, flags]
        
        process.launch()
        process.waitUntilExit()
        
        
    }
    
}
