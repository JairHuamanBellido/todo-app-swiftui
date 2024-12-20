//
//  ToolbarAppView.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 19/12/24.
//

import SwiftUI

struct ToolbarAppView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button("Quit") {
                NSApplication.shared.terminate(self)
            }
        }.frame(width: 200, height: 200)
    }
}

#Preview {
    ToolbarAppView()
}
