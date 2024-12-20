//
//  AllCategoriesView.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 16/12/24.
//

import SwiftData
import SwiftUI

struct AllCategoriesView: View {

    @Query(sort: \Category.createdAt, order: .forward) private var categories:
        [Category]

    var body: some View {
        GeometryReader { geometry in

            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Categories")
                            .font(.system(size: 36))
                            .bold()
                        Text("Total: \(categories.count)")
                            .foregroundStyle(.secondary)

                    }.padding(.vertical, 40)
                    
                    ForEach(categories, id: \.id) { category in
                        CategoryListRowView(category: category)
                    }
                    
                    AddCategoryButtonPlaceholder()
                }
            }
            .toolbarBackground(.clear)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, geometry.size.width * 0.20)
            .background(Color.listBackground)

        }
    }
}

#Preview {
    AllCategoriesView()
}
