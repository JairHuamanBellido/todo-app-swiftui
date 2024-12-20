//
//  SidebarView.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 16/12/24.
//

import SwiftUI

struct SidebarItemModel: Identifiable, Hashable {
    var id: UUID = UUID()
    var text: String
    var systemImage: String
    var destination: AnyView
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(text)
        hasher.combine(systemImage)
    }

    static func == (lhs: SidebarItemModel, rhs: SidebarItemModel) -> Bool {
        lhs.id == rhs.id && lhs.text == rhs.text
            && lhs.systemImage == rhs.systemImage
    }
}

struct SidebarView: View {

 
    private static var sidebarItems: [SidebarItemModel] = [
        SidebarItemModel(
            text: "Tasks", systemImage: "checklist",
            destination: AnyView(AllTasksView())),
        SidebarItemModel(
            text: "Categories", systemImage: "tag",
            destination: AnyView(AllCategoriesView())),
 
    ]
    @State private var selectedItem: SidebarItemModel = sidebarItems[0]

    var body: some View {

        List(selection: $selectedItem) {
            Section(header: Text("Tasks")) {

                ForEach(Self.sidebarItems, id: \.id) { navItem in
                    NavigationLink(destination: navItem.destination) {
                        Label(navItem.text, systemImage: navItem.systemImage)
                    }
                    .tag(navItem as SidebarItemModel)

                }
            }

        }
        .navigationTitle("qwe")
        .listStyle(SidebarListStyle())
        .navigationSplitViewColumnWidth(min: 200, ideal: 200, max: 400)

    }

    //    @ViewBuilder
    //    func SidebarItem(_ title: String) -> some View {
    //        HStack {
    //            Text(title).foregroundStyle(
    //                selectedItem == title
    //                    ? Color.primary : Color.primary.opacity(0.7))
    //        }
    //        .padding(.horizontal, 12)
    //        .padding(.vertical, 8)
    //        .frame(maxWidth: .infinity, alignment: .leading)
    //        .background(
    //            selectedItem == title
    //                ? Color.primary.opacity(0.1) : Color.red.opacity(0.01)
    //        )
    //        .cornerRadius(4)
    //        .onTapGesture {
    //            print("click")
    //            selectedItem = title
    //        }
    //
    //    }

}
