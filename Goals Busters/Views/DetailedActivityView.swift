//
//  DetailedActivityView.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/26/23.
//

import SwiftUI

struct DetailedActivityView: View {
    @Binding var activity: ActivityDO
    @ObservedObject var oo: ActivityOO
    
    var body: some View {
        
        Spacer()
        
        HStack {
            Button {
                activity.completionCount -= 1
            } label: {
                Image(systemName: "minus")
                    .padding(25)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.white)
                    .background(activity.color)
                    .cornerRadius(.infinity)
                    
                    
            }
            ZStack {
                Button {
                    //action
                } label: {
                    Text("\(activity.completionCount)")
                        .font(.system(size: 80))
                        .fontWeight(.black)
                        .foregroundStyle(activity.color)
                }
                
                CircularProgressView(activity: $activity)
                    .padding([.top, .bottom])
                    .frame(width: 230, height: 230)
                
            }
            
            Button {
                activity.completionCount += 1
            } label: {
                Image(systemName: "plus")
                    .padding(20)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.white)
                    .background(activity.color)
                    .cornerRadius(.infinity)
            }
        }
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Name")
                    .font(.system(.headline, design: .serif))
                    .padding(5)
                Spacer()
                ColorPicker("", selection: $activity.color)
            }
            TextField("\(activity.name)", text: $activity.name)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(activity.color, lineWidth: 2)
                )
                .padding(5)
            Text("Description")
                .font(.system(.headline, design: .serif))
                .padding(5)
            TextField(("\(activity.description)"), text: $activity.description)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(activity.color, lineWidth: 2)
                )
                .padding(5)
        }
     
        Spacer()
        
        Button {
            oo.removeActivity(activity)
        } label: {
            Image(systemName: "trash")
                .padding(20)
                .frame(width: 50, height: 50)
                .foregroundColor(Color.white)
                .background(Color.red)
                .cornerRadius(.infinity)
        }
    }
    
}

#Preview {
    DetailedActivityView(activity: .constant(ActivityDO.sampleData[0]), oo: ActivityOO())
}
