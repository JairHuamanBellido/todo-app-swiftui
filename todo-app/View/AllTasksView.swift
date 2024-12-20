//
//  AllTasksView.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 16/12/24.
//

import AppKit
import SwiftData
import SwiftUI

extension Color {
    static var listBackground: Color {
        Color(NSColor.textBackgroundColor)  // Obtiene el color de fondo nativo del sistema.
    }
}

struct AllTasksView: View {

    @Query(sort: \Task.createdAt, order: .forward) private var tasks: [Task]
    @Query(sort: \Category.createdAt, order: .forward) private var categories: [Category]
    
    var body: some View {

        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Tasks")
                            .font(.system(size: 36))
                            .bold()
                        Text("Total: \(tasks.count)")

                    }
                    .padding(.vertical, 48)

                    ForEach(tasks, id: \.id) {
                        task in
                        TaskListRowView(task: task, categories: categories)
                    }

                    AddTaskButtonPlaceholder()
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, geometry.size.width * 0.20)
            .background(Color.listBackground)

        }.toolbarBackground(.clear)
    }

}

#Preview {
    AllTasksView()
}
