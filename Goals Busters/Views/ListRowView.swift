//
//  ListRowView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/27/23.
//

import SwiftUI

struct ListRowView: View {
    @Binding var activity: ActivityDO
    @StateObject private var oo = ActivityOO()
    
    
    func sampleData() {
        let activity = ActivityDO(name: "Test", description: "This is a test item", completionCount: 7)
        oo.data.append(activity)
    }
    
    var body: some View {
        Section {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(activity.name)")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("\(activity.description)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                Spacer()
                ZStack{
                    Text("\(activity.completionCount)")
                        .padding([.top, .bottom])
                    CircularProgressView(activity: $activity)
                        .frame(width: 50, height: 50)
                        .padding([.top, .bottom])
                }
            }
            .padding([.trailing])
            .background(activity.color)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5)
            .foregroundStyle(.white)
        }
        .padding(5)
    }
}



#Preview {
    ListRowView(activity: Binding.constant(ActivityDO(name: "Test activity", description: "Test activity description")))
}
