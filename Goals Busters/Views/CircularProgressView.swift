//
//  CircularProgressView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/27/23.
//

import SwiftUI

struct CircularProgressView: View {
    @Binding var activity: ActivityDO
    @State private var isUpdating = true
    
    
       var body: some View {
           
           
                  
           ProgressView(value: activity.percentageComplete, total: 1.0)
               .progressViewStyle(CircularProgressDO(activity: $activity))
               .contentShape(Rectangle())
               .onTapGesture {
                   if activity.percentageComplete < 1.0 {
                       withAnimation {
                           activity.percentageComplete += 0.01
                       }
                   }
               }
            
       }
}

#Preview {
    CircularProgressView(activity: .constant(ActivityDO.sampleData[0]))
}
