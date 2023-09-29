//
//  GoalController.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-06.
//

import Foundation

import Foundation
import CoreData

class GoalController: ObservableObject {
    static let shared = GoalController()
    let container = NSPersistentContainer(name: "GoalModel")
    
    init() {
        container.loadPersistentStores {desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved.")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addGoal(stat: String, goalVal: Int32, timeline: Int32, timelineUnit: String, workout: String, date: Date, progress: Double, context: NSManagedObjectContext) {
        let goal = Goal(context: context)
        goal.id = UUID()
        goal.stat = stat
        goal.goalVal = goalVal
        goal.timeline = timeline
        goal.timelineUnit = timelineUnit
        goal.workout = workout
        goal.date = Date()
        goal.progress = progress
        save(context: context)
    }
    
}

