//
//  DragWebView.swift
//  SwiftServe
//
//  Created by Willson Smith on 2015-11-24.
//
//

import WebKit
import Swifter

class DragWebView : WebView {
    
    let server = HttpServer();
    
    override func draggingEntered(sender: NSDraggingInfo) -> NSDragOperation {
        return .Copy;
    }
    
    override func draggingUpdated(sender: NSDraggingInfo) -> NSDragOperation {
        return .Copy;
    }
    
    override func performDragOperation(sender: NSDraggingInfo) -> Bool {
        
        let pboardItem = sender.draggingPasteboard();
        let url = pboardItem.propertyListForType(NSFilenamesPboardType);
        let urlString = String(url![0]);
        
        server.stop();
        self.executeJavascript("removeServerDirectory", argument: nil);
        server["/(.+)"] = HttpHandlers.directory(urlString);
        server.start();
        self.executeJavascript("addServerDirectory", argument: "\(urlString)");
        return false;
//        return super.performDragOperation(sender);
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