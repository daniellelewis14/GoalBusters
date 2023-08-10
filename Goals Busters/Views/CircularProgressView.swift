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
        
           var progress = Double(activity.completionCount) > 0 ? (Double(activity.completionCount) * 0.1) : 0
           
           
           
           ProgressView(value: progress, total: 1.0)
               .progressViewStyle(CircularProgressDO(activity: $activity))
               .contentShape(Rectangle())
               .onTapGesture {
                   if progress < 1.0 {
                       withAnimation {
                           progress += 0.2
                       }
                   }
               }
       }
}

#Preview {
    CircularProgressView(activity: .constant(ActivityDO.sampleData[1]))
}
