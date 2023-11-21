//
//  MovieView.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 20/11/2023.
//

import SwiftUI

struct MovieView: View {
    
    let movie: Result
    @StateObject var imageManager = ImageManager()
    
    var body: some View {
        HStack(spacing: 15) {
            Image(uiImage: imageManager.image ?? UIImage(named: "blankImage")!)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(movie.originalTitle)
                    .foregroundStyle(Color.primary)
                    .font(.system(size: 18, weight: .medium, design: .default))
                Text(movie.releaseDate.convertDateFormat())
                    .foregroundStyle(Color(uiColor: .systemGray))
                    .font(.system(size: 16, weight: .medium))
                    .lineLimit(1)
            }
            Spacer()
        }
        .contentShape(Rectangle())
        .onAppear {
            self.imageManager.loadImage(url: movie.imageURL)
        }
    }
}
