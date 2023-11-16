//
//  UIElements.swift
//  Fitify
//
//  Created by maddie wong on 2023-11-16.
//

import SwiftUI

struct TitleText: View {
    @State var text: String
    var body: some View {
        Text("\(text)")
            .font(.largeTitle)
            .bold()
            .padding()
    }
}

struct SmallerHeading: View {
    @State var text: String
    var body: some View {
        Text("\(text)")
            .font(.title2)
            .bold()
    }
}

struct SubtitleText: View {
    @State var text: String
    var body: some View {
        Text("\(text)")
            .font(.footnote)
            .lineLimit(1)
    }
}



