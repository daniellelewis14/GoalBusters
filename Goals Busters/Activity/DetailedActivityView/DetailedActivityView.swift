//
//  DetailedActivityView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//

import SwiftUI

struct DetailedActivityView: View {
    @Binding var activity: ActivityDO
    
    var body: some View {
        VStack {
            Text(activity.name)
            Text(activity.description)
        }
        HStack {
            Button {
                activity.completionCount -= 1
            } label: {
                Image(systemName: "minus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 100)
                    .background(.green)
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(10)
            }
            
            Text("\(activity.completionCount)")
                .font(.system(size: 100))
            
            Button {
                activity.completionCount += 1
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(.green)
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    
    
    DetailedActivityView(activity: Binding.constant(ActivityDO(name: "Test name", description: "Test description")))
}
