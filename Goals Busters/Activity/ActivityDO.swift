//
//  Activity.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//
import Foundation

struct ActivityDO: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var completionCount = 0
}
