//
//  WorkoutSummaryView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-06.
//

import SwiftUI

struct WorkoutSummaryView: View {
    @State var caloriesBurned: Int32
    @State var duration: Int32
    
    var properties = ["Calories, Duration, Calories"]
    
    var body: some View {
        VStack {
            Text("Workout Overview")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Grid {
                GridRow {
                    WorkoutSummaryCard(title: "Calories", value: "\(caloriesBurned) calories", image: "flame")
                        .padding()
                    WorkoutSummaryCard(title: "Duration", value: "\(duration) minutes", image: "timer")
                        .padding()
                }
                GridRow {
                    WorkoutSummaryCard(title: "Calories", value: "\(caloriesBurned) calories", image: "flame")
                        .padding()
                    WorkoutSummaryCard(title: "Duration", value: "\(duration) minutes", image: "timer")
                        .padding()
                }
            }
            
               
        }
        .padding()
        
    }
}

#Preview {
    WorkoutSummaryView(caloriesBurned: 2, duration: 2)
}
