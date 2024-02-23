//
//  main.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 23/2/24.
//

import AppKit

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
