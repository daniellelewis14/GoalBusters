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
    var completionCount = 0
    var color = Color.blue
}
