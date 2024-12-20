//
//  AddCategoryContainer.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 18/12/24.
//

import SwiftUI

struct AddCategoryContainer: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.self) private var environment

    @Binding var isShowAddForm: Bool
    @State private var name: String = ""
    @State private var color: Color = Color(
        .sRGB, red: 0.2, green: 0.3, blue: 1)
    @State private var resolvedColor: Color.Resolved?

    @FocusState private var defaultInput: Bool

    var body: some View {
        VStack {
            VStack(alignment:.leading) {
                HStack(spacing: 2) {

                    Text("#").foregroundStyle(
                        Color(
                            .sRGB,
                            red: Double(
                                resolvedColor?.red
                                    ?? color.resolve(in: environment).red),
                            green: Double(
                                resolvedColor?.green
                                    ?? color.resolve(in: environment).green),
                            blue: Double(
                                resolvedColor?.blue
                                    ?? color.resolve(in: environment).blue))
                    )
                    TextField("Category name", text: $name)
                        .textFieldStyle(.plain)
                        .foregroundStyle(
                            Color(
                                .sRGB,
                                red: Double(
                                    resolvedColor?.red
                                        ?? color.resolve(in: environment).red),
                                green: Double(
                                    resolvedColor?.green
                                        ?? color.resolve(in: environment).green),
                                blue: Double(
                                    resolvedColor?.blue
                                        ?? color.resolve(in: environment).blue))
                        )
                        .focused($defaultInput)
                        .onAppear {
                            defaultInput = true
                        }
                }
                ColorPicker("Category color", selection: $color).onChange(
                    of: color
                ) {
                    resolvedColor = color.resolve(in: environment)
                }

             
                Divider()
                HStack(spacing: 4) {
                    Button(action: {
                        isShowAddForm.toggle()
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

                        let categoryColor: ColorType = ColorType(
                            red: Double(resolvedColor!.red),
                            green: Double(resolvedColor!.green),
                            blue: Double(resolvedColor!.blue))
                        let category = Category(
                            name: name, color: categoryColor)
                        modelContext.insert(category)
                        isShowAddForm.toggle()
                    }) {
                        Text("Add category")
                    }
                    .frame(minWidth: 64)
                    .buttonStyle(.plain)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
                    .background(Color.accentColor)
                    .cornerRadius(4)

                }
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
