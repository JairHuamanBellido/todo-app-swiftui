//
//  AddTaskContainer.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 17/12/24.
//

import SwiftData
import SwiftUI

struct AddTaskContainer: View {
    enum FocusedField {
        case firstName
    }

    @Environment(\.modelContext) var modelContext

    @Binding var isShowAddTaskForm: Bool

    @State private var taskName: String = ""
    @State private var categoriesSelected: [Category] = []
    @State private var isShowingPopover = false

    @FocusState private var usernameFieldIsFocused: Bool
    @Query(sort: \Category.createdAt, order: .forward) private var categories:
        [Category]

    var body: some View {

        VStack {
            Spacer()
            VStack {
                TextField("Task name", text: $taskName)
                    .textFieldStyle(.plain)
                    .focused($usernameFieldIsFocused)
                    .onAppear {
                        usernameFieldIsFocused = true
                    }

                HStack(spacing: 8) {
                    Text("Categories: ").foregroundStyle(.secondary)
                    ForEach(categoriesSelected, id: \.self) { category in
                        Text("#\(category.name)").foregroundStyle(
                            Color(
                                .sRGB, red: category.color.red,
                                green: category.color.green,
                                blue: category.color.blue))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 12)

                HStack {
                    Button(action: {
                        isShowingPopover.toggle()
                    }) {
                        Text("Add a categories")
                    }.popover(
                        isPresented: $isShowingPopover, arrowEdge: .bottom
                    ) {

                        VStack(alignment: .leading) {
                            Text("\(categories.count) categories").font(
                                .caption
                            ).foregroundStyle(.secondary)
                            ForEach(categories) { category in

                                HStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(
                                            Color(
                                                .sRGB, red: category.color.red,
                                                green: category.color.green,
                                                blue: category.color.blue)
                                        )
                                        .frame(width: 16, height: 16)

                                    Text("\(category.name)")
                                    Spacer()
                                    if categoriesSelected.map(\.id)
                                        .contains(category.id)
                                    {
                                        Image(systemName: "checkmark")
                                    }

                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 4)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    if categoriesSelected.map(\.self).contains(
                                        category)
                                    {
                                        categoriesSelected.removeAll(where: {
                                            $0 == category
                                        })
                                    } else {
                                        categoriesSelected.append(category)
                                    }
                                }

                            }

                        }
                        .frame(minWidth: 200)
                        .padding(20)

                    }

                }.frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                HStack(spacing: 4) {
                    Button(action: {
                        isShowAddTaskForm.toggle()
                    }) {
                        Text("Cancel")
                    }
                    .frame(minWidth: 64)
                    .buttonStyle(.plain)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(4)

                    Button(action: {
                        let task = Task(
                            title: taskName, categories: categoriesSelected)

                        modelContext.insert(task)
                        isShowAddTaskForm.toggle()
                    }) {
                        Text("Add task")
                    }
                    .frame(minWidth: 64)
                    .buttonStyle(.plain)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
                    .background(Color.accentColor)
                    .cornerRadius(4)

                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 1)
    }

}
