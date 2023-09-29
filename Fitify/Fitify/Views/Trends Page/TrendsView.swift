//
//  TrendsView.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-05.
//

import SwiftUI

struct TrendsView: View {
    @State private var showRunTrends: Bool = true
    @State private var showWalkTrends: Bool = false
    @State private var showStrengthTrends: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Trends")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                HStack {
                    Button("Runs") {
                        showRunTrends = true
                        showWalkTrends = false
                        showStrengthTrends = false
                    }
                    .padding()
                    .background(Color.iconColor)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    Button("Walks") {
                        showRunTrends = false
                        showWalkTrends = true
                        showStrengthTrends = false
                    }
                    .padding()
                    .background(Color.iconColor)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    Button("Strength Training") {
                        showRunTrends = false
                        showWalkTrends = false
                        showStrengthTrends = true
                    }
                    .padding()
                    .background(Color.iconColor)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
                if showRunTrends {
                    RunView()
                }
                if showWalkTrends {
                    WalkView()
                }
                if showStrengthTrends {
                    StrengthTrainingView()
                }
            }
            //WalkView()
            
            
            
            
            
            //StrengthTrainingView()
            
        }

    }
    
}

#Preview {
    TrendsView()
}
