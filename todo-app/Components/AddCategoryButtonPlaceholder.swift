//
//  AddCategoryButtonPlaceholder.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 18/12/24.
//

import SwiftUI

struct AddCategoryButtonPlaceholder: View {
    
    @State private var isHovering: Bool = false
    @State private var isShowingAddForm: Bool = false
    var body: some View {
        if isShowingAddForm {
            AddCategoryContainer(isShowAddForm: $isShowingAddForm)
        } else {
            HStack {
                
            
            Button(action: {
                isShowingAddForm.toggle()
            }) {
                HStack {
                    Image(systemName: "plus").foregroundStyle(Color.accentColor)
                    Text("Add category").foregroundStyle(isHovering ? Color.accentColor :  Color.secondary)
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
    AddCategoryButtonPlaceholder()
}
