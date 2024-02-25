//
//  LaunchAtLoginView.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 25/2/24.
//

import SwiftUI
import ServiceManagement


struct LaunchAtLoginView: View {
//    @State private var launchAtLogin = false {
//        didSet {
//                let helperBundleID = "com.thetechnicaljob.AutoLauncher"
//                let result = SMLoginItemSetEnabled(helperBundleID as CFString, true)
//                print(result)
//        }
//    }
    @State private var isSwitchOn = false
    @State private var isSwitchOnEnabled = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isSwitchOn) {
                Text(" Launch at Login")
            }.onChange(of: isSwitchOn) { newValue in
                setUpLoginItems(with: newValue)
            }
            
            if (isSwitchOnEnabled) {
                Text("Launch at Login enabled")
            } else {
                Text("Launch at Login NOT enabled")
            }
            
        }.frame(width: 300, height: 150, alignment: .center)
    }
    
    func setUpLoginItems(with newValue: Bool) {
        let helperBundleID = "com.thetechnicaljob.AutoLauncher"
        let result = SMLoginItemSetEnabled(helperBundleID as CFString, newValue)
        print(result)
        isSwitchOnEnabled = result
    }

}
