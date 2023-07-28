//
//  CircularProgress.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/27/23.
//

import SwiftUI

struct CircularProgressDO: ProgressViewStyle {
    @Binding var activity: ActivityDO
    var strokeWidth = 10.0

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        var strokeColor = Color.clear
        
        if activity.completionCount <= 3 {
            strokeColor = Color.red
        } else if activity.completionCount <= 5 {
            strokeColor = Color.blue
        } else if activity.completionCount <= 10 {
            strokeColor = Color.green
        } else {
            strokeColor = Color.yellow
        }

        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor,
                        style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round)
                )
            
            
                .rotationEffect(.degrees(-90))
        }
    }
}
