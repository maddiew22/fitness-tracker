//
//  HomeView.swift
//  Fitify
//
//  Created by maddie wong on 2023-09-29.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            
            Text("Daily Workout Minutes")
                .font(.title2)
                .foregroundColor(Color.textColor)
                .bold()
            Text("Over the past 7 days")
                .font(.title3)
                .bold()
            DailyMinutesChart()
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HomeView()
}
