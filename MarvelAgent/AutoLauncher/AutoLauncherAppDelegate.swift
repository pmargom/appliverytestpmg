//
//  AppDelegate.swift
//  AutoLauncher
//
//  Created by Pedro Martín Gómez on 25/2/24.
//

import Cocoa
import ServiceManagement

class AutoLauncherAppDelegate: NSObject, NSApplicationDelegate {
    
    private let mainAppBundleID = "com.thetechnicaljob.MarvelAgent"
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let runningApps = NSWorkspace.shared.runningApplications
        
        let isRunning = runningApps.contains {
            $0.bundleIdentifier == mainAppBundleID
        }
        
        if !isRunning {
            var path = Bundle.main.bundlePath as NSString
            for _ in 1...4 {
                path = path.deletingLastPathComponent as NSString
            }
            let applicationPathString = path as String
            guard let pathURL = URL(string: applicationPathString) else { return }
            NSWorkspace.shared.openApplication(at: pathURL,
                                               configuration: NSWorkspace.OpenConfiguration(),
                                               completionHandler: nil)
            
        }
    }
    
}
