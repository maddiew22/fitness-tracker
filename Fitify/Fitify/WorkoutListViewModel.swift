//
//  WorkoutListViewModel.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-02.
//

import Foundation

final class WorkoutListViewModel: ObservableObject {
    @Published var workouts: [Workout] = []
    
}
