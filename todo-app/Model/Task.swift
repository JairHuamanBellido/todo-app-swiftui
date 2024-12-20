//
//  Task.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 17/12/24.
//

import Foundation
import SwiftData

@Model
final class Task:Identifiable {
    
    @Attribute(.unique)
    var id: UUID
    
    @Attribute
    var title: String
    
    @Attribute(originalName: "created_at")
    var createdAt: Date
    
    @Attribute
    var isCompleted: Bool
    
    
    var categories: [Category]
    
    init(title: String, categories: [Category]) {
        self.id = UUID()
        self.createdAt = Date()
        self.title = title
        self.categories = categories
        self.isCompleted = false
    }
    
}
