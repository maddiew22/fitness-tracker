//
//  WorkoutSummaryCard.swift
//  Fitify
//
//  Created by maddie wong on 2023-10-06.
//

import SwiftUI

struct WorkoutSummaryCard: View {
    
    @State var title: String
    @State var value: String
    @State var image: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .foregroundColor(Color.textColor)
                .font(.system(size: 50))
            VStack {
                Text(title)
                    .font(.title3)
                    .foregroundColor(Color.textColor)
                    .bold()
                
                Text(value)
                    .font(.caption)
                    .foregroundColor(Color.textColor)
            }
            
        }
        .aspectRatio(contentMode: .fit)
        .padding()
        .background(Color.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    WorkoutSummaryCard(title: "Calories", value: "2 calories", image: "flame")
}
