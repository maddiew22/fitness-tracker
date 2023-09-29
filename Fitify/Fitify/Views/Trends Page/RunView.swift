//
//  RunView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-05.
//

import SwiftUI

struct RunView: View {
    
    var body: some View {

            VStack {
                HStack {
                    Image(systemName: "figure.run")
                    Text("Running")
                        .font(.title)
                        .bold()
                }
                .padding()
                TrendsChartView(workoutType: "Run").padding()
            }
        
    }
}

#Preview {
    RunView()
}
