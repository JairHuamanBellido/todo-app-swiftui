//
//  todo_appApp.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 16/12/24.
//

import AppKit
import SwiftData
import SwiftUI

@main
struct todo_appApp: App {

//    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = true
    @NSApplicationDelegateAdaptor var delegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: [Task.self, Category.self]).navigationTitle("Hola ")
        }

//        MenuBarExtra(
//            "App Menu Bar Extra", systemImage: "star",
//            isInserted: $showMenuBarExtra
//        ) {
//            VStack {
//
//                Button("Option 1") {
//                    print("Option 1 selected")
//                }
//                .keyboardShortcut("1", modifiers: [.command])  // Cmd + 1
//                Divider()
//                Button("Option 2") {
//                    print("Option 2 selected")
//                }
//                .keyboardShortcut("2", modifiers: [.command])  // Cmd + 2
//
//                Button("Option 3") {
//                    print("Option 3 selected")
//                }
//                Button("Subscribe to our YouTube channel") {
//                    print("Option 3 selected")
//                }
//                .keyboardShortcut("3", modifiers: [.command])  // Cmd + 3
//            }
//
//        }.menuBarExtraStyle(.menu).windowIdealSize(.automatic)

    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover = NSPopover()

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Crear el ítem en la barra de menús
        statusItem = NSStatusBar.system.statusItem(
            withLength: NSStatusItem.variableLength)
        if let button = statusItem?.button {
            button.image = NSImage(
                systemSymbolName: "star.fill",
                accessibilityDescription: "Menu Bar App")
            button.action = #selector(togglePopover)
        }

        // Configurar el contenido del popover
        popover.contentViewController = NSHostingController(
            rootView: ToolbarAppView())
        popover.behavior = .transient
    }

    
    
    @objc func togglePopover() {
        guard let button = statusItem?.button else { return }

        if popover.isShown {
            popover.performClose(nil)
        } else {
            popover.show(
                relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }

}
