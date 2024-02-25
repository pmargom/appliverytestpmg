//
//  AppDelegate.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 23/2/24.
//

import Foundation
import Cocoa
import SwiftUI
import ServiceManagement

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var mainWindow: NSWindow!
    private var preferencesWindow: NSWindow!
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
        
        let showDataMenuItem = NSMenuItem(title: "Open Characters", action: #selector(onOpenCharactersButtonTapped) , keyEquivalent: "1")
        menu.addItem(showDataMenuItem)

        let showPreferencesMenuItem = NSMenuItem(title: "Preferences", action: #selector(onOpenPreferencesButtonTapped) , keyEquivalent: "2")
        menu.addItem(showPreferencesMenuItem)

        menu.addItem(NSMenuItem.separator())
        
        menu.addItem(NSMenuItem(title: "Exit", action: #selector(onTerminateAppButtonTapped), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    
    @MainActor @objc func onOpenCharactersButtonTapped() {
        mainWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 880, height: 970),
            styleMask: [.miniaturizable, .closable, .resizable, .titled],
            backing: .buffered, defer: false)
        mainWindow.center()
        mainWindow.title = "Character List"
        mainWindow.contentView = NSHostingView(rootView: CharacterListFactory.create())
        mainWindow.makeKeyAndOrderFront(nil)
    }
    
    @MainActor @objc func onOpenPreferencesButtonTapped() {
        preferencesWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 200, height: 100),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        preferencesWindow.center()
        preferencesWindow.setFrameAutosaveName("Preferences")
        preferencesWindow.contentView = NSHostingView(rootView: LaunchAtLoginView())
        preferencesWindow.makeKeyAndOrderFront(nil)
    }
    
    @objc func onTerminateAppButtonTapped() {
        NSApplication.shared.terminate(self)
    }
    
}
