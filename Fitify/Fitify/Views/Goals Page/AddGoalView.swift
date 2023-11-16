//
//  AddGoalView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-06.
//

import SwiftUI

struct AddGoalView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var stat = "Calories"
    @State private var goalVal = 0
    @State private var timeline = 3
    @State private var timelineUnit = "Month(s)"
    @State private var workout = "Exercise"
    
    @State private var selectedDate: Date = Date()
    
    let workoutTypes = ["Boxing", "Cycling", "Dancing", "HIIT", "Pilates", "Running", "Sports", "Strength Training", "Swimming", "Walking", "Yoga", "Exercise"]
    let statTypes = ["Minutes", "Calories"]
    let timelineUnitTypes = ["Day(s)", "Week(s)", "Month(s)"]
    
    var body: some View {
        Form {
            Section {
                SmallerHeading(text: "Add Goal")
                VStack {
                    Picker ("Select Workout Type", selection: $workout) {
                        ForEach(workoutTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                
                VStack {
                    HStack {
                        Text("Goal:")
                        TextField("Enter", value: $goalVal, format: .number)
                            .opacity(0.7)
                        Picker ("", selection: $stat) {
                            ForEach(statTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                
                VStack {
                    HStack {
                        Text("Timeline:")
                        TextField("Enter", value: $timeline, format: .number)
                            .opacity(0.7)
                        Picker ("", selection: $timelineUnit) {
                            ForEach(timelineUnitTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                }
                
                
                VStack (alignment: .leading){
                    Text("Goal Preview").bold()
                    Text("\(goalVal) \(stat) of \(workout) in \(timeline) \(timelineUnit)")
                }
                
                Button("Set Goal") {
                    DataController().addGoal(stat: stat, goalVal: Int32(goalVal), timeline: Int32(timeline), timelineUnit: timelineUnit, workout: workout, date: Date(), progress: 0, context: managedObjContext)
                    dismiss()
                }
            }
        }
    }
    
    
}

#Preview {
    AddGoalView()
}
