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
    @State private var goalCompletions = 0
    @ObservedObject var oo: ActivityOO
    @State private var color = Color.blue
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Spacer()
        ZStack {
            
            TransparentBlurView()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Add New Goal")
                        .font(.system(size: 30, design: .serif).weight(.bold))
                        .padding([.bottom, .leading])
                    HStack {
                        Text("Name")
                            .font(.system(.headline, design: .serif))
                            .padding(5)
                        Spacer()
                        ColorPicker("", selection: $color)
                    }
                    TextField("\(name)", text: $name)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(color, lineWidth: 2)
                        )
                        .padding(5)
                    Text("Description")
                        .font(.system(.headline, design: .serif))
                        .padding(5)
                    TextField(("\(description)"), text: $description)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(color, lineWidth: 2)
                        )
                        .padding(5)
                    HStack {
                        Text("Desired Activity Completions: ") +
                        Text(" \(goalCompletions + 1)")
                    }
                    .font(.system(.headline, design: .serif))
                    .padding(5)
                    Picker("Goal completions", selection: $goalCompletions) {
                        ForEach(1..<201) { number in
                            Text("\(number)")
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                Spacer()
                
                Button {
                    let goal = ActivityDO(name: name, description: description, goalCompletions: goalCompletions, color: color)
                    oo.data.append(goal)
                    dismiss()
                } label: {
                    Text("Save")
                        .padding(12)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .background(color)
                        .cornerRadius(8)
                }
                .shadow(color: color, radius: 2, y: 5)
                .disabled(name.isEmpty || description.isEmpty)
            }
            
            
        }
    }
}

#Preview {
    AddActivityView(oo: ActivityOO())
}
