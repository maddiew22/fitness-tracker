//
//  WalkView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-05.
//

import SwiftUI

struct WalkView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "figure.walk")
                Text("Walking")
                    .font(.title)
                    .bold()
            }
            .padding()
            TrendsChartView(workoutType: "Walk").padding()
        }
    }
}

#Preview {
    WalkView()
}
