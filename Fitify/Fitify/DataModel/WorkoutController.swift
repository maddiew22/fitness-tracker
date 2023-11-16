//
//  WorkoutController.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-02.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let shared = DataController()
    let container = NSPersistentContainer(name: "WorkoutModel")
    
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
    
    func addWorkout(type: String, calories: Int32, date: Date, duration: Int32, context: NSManagedObjectContext) {
        let workout = Entity(context: context)
        workout.id = UUID()
        workout.date = date
        workout.type = type
        workout.calories = calories
        workout.duration = duration
        save(context: context)
    }
    
    func findAll(in managedObjectContext: NSManagedObjectContext) -> [Entity] {
        // Helpers
        var workouts: [Entity] = []

        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()

        do {
            // Perform Fetch Request
            workouts = try managedObjectContext.fetch(fetchRequest)
        } catch {
            print("Unable to Fetch Workouts, (\(error))")
        }

        return workouts
    }
    
    
    func filteredWorkoutSearch(startDate: Date, endDate: Date, exercise: String, stat: String, context: NSManagedObjectContext) -> Double {
        
        var workouts: [Entity] = []
        var progress = 0

        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "(date >= %@) AND (date <= %@)", startDate as CVarArg, endDate as CVarArg)

        do {
            // Perform Fetch Request
            workouts = try context.fetch(fetchRequest)
        } catch {
            print("Unable to Fetch Workouts, (\(error))")
        }
        
        for workout in workouts {
            if workout.type == exercise || exercise == "Exercise" {
                if stat == "Calories" {
                    progress = progress + Int(workout.calories)
                }
                else {
                    progress = progress + Int(workout.duration)
                }
            }
        }

        return Double(progress)
    }
    
    func addGoal(stat: String, goalVal: Int32, timeline: Int32, timelineUnit: String, workout: String, date: Date, progress: Double, context: NSManagedObjectContext) {
        let goal = Goals(context: context)
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
