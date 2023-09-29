//
//  AddWorkoutView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-02.
//

import SwiftUI

struct AddWorkoutView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var type = "Other"
    @State private var calories = 0
    @State private var duration = 1
    
    @State private var selectedDate: Date = Date()
    
    let workoutTypes = ["Boxing", "Cycle", "Dance", "HIIT", "Pilates", "Run", "Sports", "Strength Training", "Swim", "Walk", "Yoga", "Other"]
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        Form {
            Text("Add Workout")
                .font(.title2)
                .bold()
            Section {
                VStack {
                    Picker ("Select Workout Type", selection: $type) {
                        ForEach(workoutTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                
                VStack(alignment: .leading){
                    HStack {
                        Text("Calories Burned:")
                        TextField("Enter", value: $calories, format: .number)
                            .opacity(0.7)
                    }
                }
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Duration:")
                        TextField("Enter", value: $duration, format: .number)
                            .opacity(0.7)
                    }
                }
                
                DatePicker("Date",
                           selection: $selectedDate,
                           displayedComponents: .date)
                
                Button("Add") {
                    DataController().addWorkout(type: type, calories: Int32(calories), date: selectedDate, duration: Int32(duration), context: managedObjContext)
                    dismiss()
                }

            }
        }
    }
}

#Preview {
    AddWorkoutView()
}
