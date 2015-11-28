//
//  DragWebView.swift
//  SwiftServe
//
//  Created by Willson Smith on 2015-11-24.
//
//

import WebKit
import Swifter

class DragWebView : ScriptableWebView {
    
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
        
        manageWebServer(self, start: true, directory: urlString);
        
        return false;
    }
    
}

func manageWebServer(webview: ScriptableWebView, start: Bool, directory: String = "") {
    
    let server = HttpServer();

    if (start == false) {
        server.stop();
    } else {
        server.stop();
        webview.executeJavascript("removeServerDirectory", argument: nil);
        server["/(.+)"] = HttpHandlers.directory(directory);
        server.start();
        webview.executeJavascript("addServerDirectory", argument: "\(directory)");
    }
}