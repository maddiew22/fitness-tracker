//
//  GoalsView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-06.
//

import SwiftUI

struct GoalsView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var goals: FetchedResults<Goals>
    
    @StateObject private var dataController = DataController.shared
    @State private var showingAddGoalView = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 6) {
            
            VStack(alignment: .leading, spacing: 6) {
                
                TitleText(text: "Current Goals")
                
                Button {
                    showingAddGoalView.toggle()
                    
                } label: {
                    Label("New Goal", systemImage: "plus.circle")
                }
                .padding(.top)
                
                List {
                    ForEach(goals) { goal in
                        
                        VStack(alignment: .leading) {
                            Text("\(goal.goalVal) " + goal.stat! + " of " + goal.workout! + " in \(goal.timeline) " + goal.timelineUnit!).bold()
                            ProgressView (value: calculateCurrentProgress(goal: goal))
                            SubtitleText(text: "\(Int(goal.progress*Double(goal.goalVal))) / \(goal.goalVal) " + goal.stat!)
                                .foregroundColor(Color.textColor)
                        }
                        .padding()
                    }
                    .onDelete(perform: deleteGoal)
                }
                .listStyle(.plain)
            }
        }
        .sheet(isPresented: $showingAddGoalView) {
            AddGoalView()
        }
        .padding()
    }
    
    private func deleteGoal(offsets: IndexSet) {
        withAnimation {
            offsets.map { goals[$0] }.forEach(managedObjectContext.delete)
            DataController().save(context: managedObjectContext)
        }
    }
    
    private func calculateCurrentProgress(goal: Goals) -> Double {
        let goalStartDate = goal.date!
        var goalEndDate: Date
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        if goal.timelineUnit == "Day(s)" {
            dateComponent.day = Int(goal.timeline)
        }
        else if goal.timelineUnit == "Week(s)" {
            dateComponent.day = Int(goal.timeline*7)
        }
        else {
            dateComponent.month = Int(goal.timeline)
        }
        
        goalEndDate = calendar.date(byAdding: dateComponent, to: goal.date!)!
        
        goal.progress = dataController.filteredWorkoutSearch(startDate: goalStartDate, endDate: goalEndDate, exercise: goal.workout!, stat: goal.stat!, context: managedObjectContext)
        goal.progress = goal.progress/Double(goal.goalVal)
        
        return goal.progress
    }
    
}

#Preview {
    GoalsView()
}
