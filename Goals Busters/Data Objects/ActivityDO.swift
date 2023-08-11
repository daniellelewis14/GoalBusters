//
//  Activity.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//
import SwiftUI

struct ActivityDO: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var completionCount: Int
    var goalCompletions: Int
    var color = Color.blue
    
    init(id: UUID = UUID(), name: String, description: String, completionCount: Int = 0, goalCompletions: Int, color: SwiftUI.Color = Color.blue) {
        self.id = id
        self.name = name
        self.description = description
        self.completionCount = completionCount
        self.goalCompletions = goalCompletions
        self.color = color
    }
    
    var percentageComplete: Double {
        get {
            var percentage = Double(self.completionCount) / Double(self.goalCompletions)
            if percentage < 0 {
                return 0
            } else {
                return percentage
            }
        }
        set {
            
        }
    }
    
    
}

extension ActivityDO {
    static let sampleData = [
        ActivityDO(name: "Learn VisionOS", description: "Get the VisionOS SDK and get to work!", completionCount: 30, goalCompletions: 100),
        ActivityDO(name: "Learn SwiftUI", description: "100 Days of SwiftUI", completionCount: 8, goalCompletions: 100),
        ActivityDO(name: "Exercise", description: "100 push ups a day for 30 days", goalCompletions: 30)
    ]
}
