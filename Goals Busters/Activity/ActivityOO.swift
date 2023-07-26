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
    @Published var data: [ActivityDO] = []
    
    func fetch() {
        data = self.data
    }
}
