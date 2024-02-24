//
//  AppDelegate.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 23/2/24.
//

import Foundation
import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var window: NSWindow!
    private var statusItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {        
        setAppAsAgent()
    }
    
    func setAppAsAgent() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        guard let button = statusItem.button else {
            return
        }
        
        button.image = NSImage(systemSymbolName: "book.circle", accessibilityDescription: "1")
        
        setupMenus()
    }
    
    func setupMenus() {
        NSApp.activate(ignoringOtherApps: true) // Prevent window order warning when menu is shown

        let menu = NSMenu()
        
        let one = NSMenuItem(title: "Open Comics", action: #selector(onOpenComicsButtonTapped) , keyEquivalent: "1")
        menu.addItem(one)
        
        menu.addItem(NSMenuItem.separator())
        
        menu.addItem(NSMenuItem(title: "Exit", action: #selector(onTerminateAppButtonTapped), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    
    @MainActor @objc func onOpenComicsButtonTapped() {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 680, height: 770),
            styleMask: [.miniaturizable, .closable, .resizable, .titled],
            backing: .buffered, defer: false)
        window.center()
        window.title = "Marvel Comic List"
        window.contentView = NSHostingView(rootView: CharacterListFactory.create())
        window.makeKeyAndOrderFront(nil)
    }
    
    @objc func onTerminateAppButtonTapped() {
        NSApplication.shared.terminate(self)
    }
    
}
