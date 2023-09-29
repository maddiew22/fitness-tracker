//
//  TabsView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-05.
//

import SwiftUI

struct TabsView: View {
    
    @StateObject private var dataController = DataController.shared
    @StateObject private var goalController = GoalController.shared
    
    var body: some View {
        TabView {
            RecentWorkoutsView(workoutDisplayLimit: 5, navigationTitle: "Fitify").environment(\.managedObjectContext, dataController.container.viewContext)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            TrendsView().environment(\.managedObjectContext, dataController.container.viewContext)
                .tabItem {
                    Label("Trends", systemImage: "chart.line.uptrend.xyaxis")
                }
            GoalsView().environment(\.managedObjectContext, dataController.container.viewContext)
                .tabItem {
                    Label("Goals", systemImage: "trophy")
                }
        }
        .accentColor(Color.iconColor)
    }
}

#Preview {
    TabsView()
}
