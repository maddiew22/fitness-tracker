//
//  WorkoutListView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-05.
//

import SwiftUI

struct WorkoutListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var workout: FetchedResults<Entity>
    
    @State private var showingAddView = false
    @State var workoutDisplayLimit = 100
    @State var navigationTitle = "All Workouts"
    
    //should remove this
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        
            VStack(alignment: .leading) {
    
                VStack {
                    
                    List {
                        ForEach(workout.prefix(workoutDisplayLimit)) { workout in
                                HStack(spacing: 20) {
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .fill(Color.iconColor.opacity(0.3))
                                        .frame(width: 44, height: 44)
                                        .overlay {
                                            Image(systemName: {
                                                switch workout.type {
                                                case "Boxing":
                                                    return WorkoutIcon.boxing.rawValue
                                                case "Cycle":
                                                    return WorkoutIcon.cycle.rawValue
                                                case "Dance":
                                                    return WorkoutIcon.dance.rawValue
                                                case "HIIT":
                                                    return WorkoutIcon.hiit.rawValue
                                                case "Pilates":
                                                    return WorkoutIcon.pilates.rawValue
                                                case "Run":
                                                    return WorkoutIcon.run.rawValue
                                                case "Sports":
                                                    return WorkoutIcon.sports.rawValue
                                                case "Strength Training":
                                                    return WorkoutIcon.strengthTraining.rawValue
                                                case "Swim":
                                                    return WorkoutIcon.swim.rawValue
                                                case "Walk":
                                                    return WorkoutIcon.walk.rawValue
                                                case "Yoga":
                                                    return WorkoutIcon.yoga.rawValue
                                                default:
                                                    return WorkoutIcon.other.rawValue
                                                }
                                            }())
                                        }
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(workout.type!)
                                            .font(.subheadline)
                                            .bold()
                                            .lineLimit(1)
                                        Text("\(workout.calories) calories")
                                            .font(.footnote)
                                            .foregroundColor(Color.textColor)
                                            .lineLimit(1)
                                    }
                                    Spacer()
                                    VStack {
                                        Text("\(workout.duration) minutes")
                                            .font(.footnote)
                                            .opacity(0.7)
                                            .lineLimit(1)
                                        Text("\(workout.date!, formatter: dateFormatter)")
                                            .font(.footnote)
                                            .opacity(0.7)
                                            .lineLimit(1)
                                    }
                                }
                                .padding([.top, .bottom], 8)
                        }
                        .onDelete(perform: deleteWorkout)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(navigationTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add Workout", systemImage: "plus.circle")
                    }
                }
            }.sheet(isPresented: $showingAddView) {
                AddWorkoutView()
            }
        
    }
    
    private func deleteWorkout(offsets: IndexSet) {
        withAnimation {
            offsets.map { workout[$0] }.forEach(managedObjectContext.delete)
            DataController().save(context: managedObjectContext)
        }
    }
    
    
}

#Preview {
    WorkoutListView()
}
