//
//  ContentView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var oo: ActivityOO
    
    var body: some View {
        ActivityView(oo: oo)
    }
}

#Preview {
    ContentView(oo: ActivityOO())
}
