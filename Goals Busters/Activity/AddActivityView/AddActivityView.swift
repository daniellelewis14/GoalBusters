//
//  AddActivityView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//

import SwiftUI

struct AddActivityView: View {
    @State private var name = ""
    @State private var description = ""
    @ObservedObject var oo: ActivityOO
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Goal")
                .font(.title2)
            TextField("Add your goal", text: $name)
            Text("Decription")
                .font(.title2)
            TextField("Describe your goal", text: $description)
        }
        Button("Save") {
            let goal = ActivityDO(name: name, description: description)
            oo.data.append(goal)
            dismiss()
        }
    }
}

#Preview {
    AddActivityView(oo: ActivityOO())
}
