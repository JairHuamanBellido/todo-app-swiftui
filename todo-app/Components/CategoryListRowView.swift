//
//  CategoryListRowView.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 18/12/24.
//

import SwiftUI

struct CategoryListRowView: View {
    @Environment(\.modelContext) var modelContext
    
    let category: Category
    
    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {

            HStack {
                Text("#\(category.name)")
                    .foregroundStyle(Color(.sRGB, red: category.color.red, green: category.color.green, blue: category.color.blue))
                

            }.frame( alignment: .center).padding(.bottom, 6).padding(.leading, 4)

            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.clear)
        .padding(.vertical, 3)
        .contentShape(Rectangle()) // Define la forma clickeable
        .contextMenu {
        
            Button("Delete"){
                modelContext.delete(category)
            }
            
        }
    }
}
