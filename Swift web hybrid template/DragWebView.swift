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
        let urlString = pboardItem.propertyListForType(NSFilenamesPboardType);
        Swift.print("\(String(urlString![0]))");
        
        server.stop();
        server["/(.+)"] = HttpHandlers.directory(String(urlString![0]));
        server.start();
        return false;
//        return super.performDragOperation(sender);
    }
    
}