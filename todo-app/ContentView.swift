//
//  ContentView.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 16/12/24.
//

import SwiftUI

struct SidebarItem {
    var label: String
    var icon: Image
}

struct ContentView: View {

    var body: some View {

        NavigationSplitView {
            SidebarView()
        } detail: {
            AllTasksView()

        }.navigationTitle("")

    }

}

#Preview {
    ContentView()
}
