//
//  ViewController.swift
//  Swift web hybrid template
//
//  Created by Willson Smith on 2015-11-09.
//
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var webView: DragWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let url = NSBundle.mainBundle().URLForResource("index", withExtension:"html");
        let request = NSURLRequest(URL: url!);
        
        self.webView.mainFrame.loadRequest(request);
        self.webView.windowScriptObject.setValue(self, forKey: "swift");
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

