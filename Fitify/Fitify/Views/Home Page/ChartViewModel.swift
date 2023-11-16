//
//  ChartViewModel.swift
//  Fitify
//
//  Created by maddie wong on 2023-11-16.
//

import Foundation
import SwiftUI

class ChartsViewModel {
    var workout: FetchedResults<Entity>
    init(workout: FetchedResults<Entity>) {
        self.workout = workout
    }
    
    func totalDailyMinutes(date: Date) -> Int {
        var totalMinutesToday : Int = 0
        for item in workout {
            if Calendar.current.isDate(item.date!, inSameDayAs: date) {
                totalMinutesToday += Int(item.duration)
            }
        }
        return totalMinutesToday
    }
    
    func findLast7WorkoutsOfType(workoutType: String) -> [Entity] {
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
