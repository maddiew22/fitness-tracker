//
//  WorkoutTrendView.swift
//  Fitify
//
//  Created by maddie wong on 2023-11-16.
//

import SwiftUI

struct WorkoutTrendView: View {
    @State var iconName: String
    @State var title: String
    @State var workoutType: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: iconName)
                TitleText(text: "\(title)")
            }
            TrendsChartView(workoutType: workoutType).padding()
        }
    }
}

#Preview {
    WorkoutTrendView(iconName: "figure.run", title: "Running", workoutType: "Run")
}
