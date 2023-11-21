//
//  RatingView.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 21/11/2023.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack {
            ForEach(1..<5) { _ in
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    .font(.footnote)
            }
            Image(systemName: "star.fill")
                .foregroundStyle(.white)
                .font(.footnote)
        }
    }
}
#Preview {
    RatingView()
}
