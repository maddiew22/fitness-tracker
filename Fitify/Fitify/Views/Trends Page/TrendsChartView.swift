//
//  TrendsChartView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-06.
//

import SwiftUI
import Charts
import CoreData

struct TrendsChartView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var workout: FetchedResults<Entity>
    
    @State var workoutType: String

    var body: some View {
        VStack {
            Text("Calories Burned")
                .font(.title2)
                .foregroundColor(Color.textColor)
                .bold()
            Text("Over the past 7 \(workoutType)s")
                .font(.title3)
                .bold()
            VStack {
                
                Chart {
                    ForEach(findLast7WorkoutsOfType(workoutType: workoutType)) { item in
                        LineMark(x: .value(workoutType, "\(item.id)"), y: .value("Calories", item.calories))
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .chartXAxis(.hidden)
                .chartYAxis{
                    AxisMarks(position: .leading)
                }
                .padding()
            }
            .padding()
            .background(Color.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
        }
        .padding()
        
        VStack {
            Text("\(workoutType) Duration")
                .font(.title2)
                .foregroundColor(Color.textColor)
                .bold()
            Text("Over the Past 7 \(workoutType)s")
                .font(.title3)
                .bold()
            VStack {
                
                Chart {
                    ForEach(findLast7WorkoutsOfType(workoutType: workoutType)) { item in
                        LineMark(x: .value(workoutType, "\(item.id)"), y: .value("Calories", item.duration))
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .chartXAxis(.hidden)
                .chartYAxis{
                    AxisMarks(position: .leading)
                }
                .padding()
            }
            .padding()
            .background(Color.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
        }
        .padding()
    }
    
    private func findLast7WorkoutsOfType(workoutType: String) -> [Entity] {
        var workouts : [Entity] = []
        for item in workout {
            if item.type == workoutType {
                if workouts.count < 8 {
                    workouts.append(item)
                }
                
            }
        }
        return workouts.reversed()
    }

}


#Preview {
    TrendsChartView(workoutType: "Run")
}
