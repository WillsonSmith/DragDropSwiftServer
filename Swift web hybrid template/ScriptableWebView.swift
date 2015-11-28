//
//  ScriptableWebView.swift
//  SwiftServe
//
//  Created by Willson Smith on 2015-11-28.
//
//

import WebKit

class ScriptableWebView : WebView {
    override class func webScriptNameForSelector(selector: Selector) -> String! {
        switch(selector) {
        case "getCurrentVersion:":
            return "getCurrentVersion";
        default:
            return nil;
        }
    }
    
    override class func isSelectorExcludedFromWebScript(selector: Selector) -> Bool {
        return false;
    }
    
    
    func executeJavascript(functionToRun:String, argument:String?) {
        var functionName:String;
        var arg:String;
        if ((argument) != nil) {
            arg = argument!;
        } else {
            arg = "";
        }
        
        functionName = "\(functionToRun)('\(arg)')";
        self.stringByEvaluatingJavaScriptFromString(functionName);
    }
}