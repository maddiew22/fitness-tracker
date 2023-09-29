//
//  StrengthTrainingView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-05.
//

import SwiftUI

struct StrengthTrainingView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "figure.strengthtraining.traditional")
                Text("Strength Training")
                    .font(.title)
                    .bold()
            }
            .padding()
            TrendsChartView(workoutType: "Strength Training").padding()
        }
    }
}

#Preview {
    StrengthTrainingView()
}
