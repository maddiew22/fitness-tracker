//
//  RecentWorkoutsView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-02.
//

import SwiftUI
import CoreData

struct RecentWorkoutsView: View {
    
    @State private var showingAddView = false
    @State var workoutDisplayLimit: Int
    @State var navigationTitle: String
    
    //should remove this
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack {
                    HomeView()
                }
                .padding()
                .background(Color.backgroundColor)
                VStack {
                    HStack {
                        Text("Recent Workouts")
                            .font(.title2)
                            .bold()
                            .padding([.top, .leading])
                        Spacer()
                        NavigationLink {
                            WorkoutListView()
                        } label: {
                            HStack(spacing: 4) {
                                Text("See All")
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(Color.textColor)
                            .padding([.top, .trailing])
                        }
                    }
                    WorkoutListView(workoutDisplayLimit: 5, navigationTitle: "Fitify")
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
}

#Preview {
    RecentWorkoutsView(workoutDisplayLimit: 5, navigationTitle: "Fitify")
}
