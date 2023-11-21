//
//  WatchNowButtonStyle.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 22/11/2023.
//

import SwiftUI

struct WatchNowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .font(.system(size: 18, weight: .medium))
            .padding(.horizontal, 50)
            .padding(.vertical, 10)
            .background(configuration.isPressed ? Color.red.opacity(0.8) : Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
