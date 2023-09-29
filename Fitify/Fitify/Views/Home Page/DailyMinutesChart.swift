//
//  DailyMinutesChart.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-02.
//

import SwiftUI
import Charts
import CoreData

struct DailyMinutesChart: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var workout: FetchedResults<Entity>


    var body: some View {
        VStack {
            Chart {
                BarMark(x: .value("Type", ""), y: .value("Minutes", totalDailyMinutes(date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!))).foregroundStyle(Color.iconColor).cornerRadius(10)
                BarMark(x: .value("Type", " "), y: .value("Minutes", totalDailyMinutes(date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!))).foregroundStyle(Color.iconColor).cornerRadius(10)
                BarMark(x: .value("Type", "   "), y: .value("Minutes", totalDailyMinutes(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!))).foregroundStyle(Color.iconColor).cornerRadius(10)
                BarMark(x: .value("Type", "    "), y: .value("Minutes", totalDailyMinutes(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!))).foregroundStyle(Color.iconColor).cornerRadius(10)
                BarMark(x: .value("Type", "     "), y: .value("Minutes", totalDailyMinutes(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!))).foregroundStyle(Color.iconColor).cornerRadius(10)
                BarMark(x: .value("Type", "      "), y: .value("Minutes", totalDailyMinutes(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!))).foregroundStyle(Color.iconColor).cornerRadius(10)
                BarMark(x: .value("Type", "Today"), y: .value("Minutes", totalDailyMinutes(date: Date.now))).foregroundStyle(Color.iconColor).cornerRadius(10)
            }
            .aspectRatio(1.5, contentMode: .fill)
            .padding()
            
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
    
    private func totalDailyMinutes(date: Date) -> Int {
        var totalMinutesToday : Int = 0
        for item in workout {
            if Calendar.current.isDate(item.date!, inSameDayAs: date) {
                totalMinutesToday += Int(item.duration)
            }
        }
        return totalMinutesToday
    }

}

#Preview {
    DailyMinutesChart()
}
