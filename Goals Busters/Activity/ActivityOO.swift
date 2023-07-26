//
//  ActivityOO.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//

// Observable Object
import Combine
import SwiftUI

class ActivityOO: ObservableObject {
    @Published var data = [ActivityDO]() {
        didSet {
            let encoder = JSONEncoder()
            // Encodes data once added to Expense Item array
            if let encoded = try? encoder.encode(data) {
                UserDefaults.standard.set(encoded, forKey: "Data")
            }
        }
    }
    // loads saved UserData when opening the app
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Data") {
            if let decodedData = try? JSONDecoder().decode([ActivityDO].self, from: savedItems) {
                data = decodedData
                return
            }
        }
        
        data = []
    }
}
