//
//  TaskListRowView.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 17/12/24.
//

import SwiftUI

struct TaskListRowView: View {

    let task: Task
    let categories: [Category]
    @State private var isSelected: Bool = false
    @Environment(\.modelContext) var modelContext

    var body: some View {
        VStack(alignment: .leading) {

            HStack {
                HStack {
                    TasksStatusButton()
                }
                .frame(width: 16, height: 16)
                .onHover { inside in
                    if inside {
                        NSCursor.pointingHand.push()
                    } else {
                        NSCursor.pop()
                    }
                }
                .onTapGesture {
                    task.isCompleted.toggle()
                }

                Text(task.title)

            }.frame(alignment: .center).padding(.bottom, 6).padding(.leading, 4)
            HStack {
                ForEach(task.categories, id: \.id) {
                    category in
                    let uniqueID = "\(task.id)_\(category.id)"

                    HStack {
                        Image(systemName: "tag.fill")
                            .frame(width: 16, height: 16)
                        Text("\(category.name)")
                    }
                    .id(uniqueID)
                    .foregroundStyle(
                        Color(
                            .sRGB, red: category.color.red,
                            green: category.color.green,
                            blue: category.color.blue)
                    )
                }
            }
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.clear)
        .padding(.vertical, 3)
        .contentShape(Rectangle())
        .contextMenu {

            Menu("Add Category") {
                ForEach(categories) { category in

                    Button(action: {
                        task.categories.append(category)
                    }) {
                        HStack {
                            Image(systemName: "tag.fill")
                            Text(category.name)
                        }
                    }
                }

            }
            Button("Delete") {
                modelContext.delete(task)
            }

            Button(action: {
                task.isCompleted.toggle()
            }) {
                if !task.isCompleted {
                    Text("Mark as completed")
                } else {
                    Text("Mark as not completed")
                }
            }

        }

    }

    @ViewBuilder
    private func TasksStatusButton() -> some View {

        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            .foregroundStyle(Color.accentColor)
            .font(.system(size: 16))

    }
}
