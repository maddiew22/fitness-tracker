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
            
            SmallerHeading(text: "Daily Workout Minutes")
                .foregroundColor(Color.textColor)
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
