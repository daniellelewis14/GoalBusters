//
//  Activity.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//
import Foundation

struct ActivityDO: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var completionCount = 0
}
