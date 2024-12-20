//
//  Category.swift
//  todo-app
//
//  Created by Jair Orlando Huaman Bellido on 18/12/24.
//

import Foundation
import SwiftData
import SwiftUI

struct ColorType: Codable {
    var red: Double
    var green: Double
    var blue: Double
}

@Model
final class Category: Identifiable, Hashable {

    @Attribute(.unique)
    var id: UUID

    var name: String

    @Attribute(originalName: "created_at")
    var createdAt: Date

    var color: ColorType

    @Relationship(inverse: \Task.categories)
    var tasks: [Task]

    init(name: String, color: ColorType) {
        self.id = UUID()
        self.createdAt = Date()
        self.name = name
        self.color = color
        self.tasks = []
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(createdAt)
        hasher.combine(tasks)
    
    }
}
