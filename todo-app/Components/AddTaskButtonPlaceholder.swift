//
//  AddTaskButtonPlaceholder.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 17/12/24.
//

import SwiftUI

struct AddTaskButtonPlaceholder: View {
    
    @State private var isHovering: Bool = false
    @State private var isShowAddTaskForm: Bool = false
    var body: some View {
        
        if isShowAddTaskForm {
            AddTaskContainer(isShowAddTaskForm: $isShowAddTaskForm)
        } else {
            HStack {
                
            
            Button(action: {
                isShowAddTaskForm.toggle()
            }) {
                HStack {
                    Image(systemName: "plus").foregroundStyle(Color.accentColor)
                    Text("Add task").foregroundStyle(isHovering ? Color.accentColor :  Color.secondary)
                }
            }
            .buttonStyle(.plain)
            .onHover { isHover in
                isHovering = isHover
                
                if isHover {
                    NSCursor.pointingHand.push()
                } else {
                    NSCursor.pop()
                }
            }
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

#Preview {
    AddTaskButtonPlaceholder()
}
