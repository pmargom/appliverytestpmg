//
//  main.swift
//  AutoLauncher
//
//  Created by Pedro Martín Gómez on 25/2/24.
//

import AppKit

let app = NSApplication.shared
let delegate = AutoLauncherAppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
