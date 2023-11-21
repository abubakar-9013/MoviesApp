//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 21/11/2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    @StateObject var imageManager = ImageManager()
    @StateObject var viewModel = MovieDetailVM()
    let selctedMovie: Result

    
    var body: some View {
        ScrollView {
            if let movieDetail = viewModel.movieDetails {
                ZStack {
                    Color.appPrimary.ignoresSafeArea(.all)
                    VStack {
                        PosterImage()
                        Text(movieDetail.originalTitle)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 34, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .offset(y: -15)
                        Text(viewModel.prepareMovieReleaseInfo(movieDetail: movieDetail))
                            .foregroundStyle(Color(uiColor: .systemGray))
                            .font(.system(size: 16, weight: .regular))
                            .offset(y: -10)
                        HStack(spacing: 10) {
                            Text("\(movieDetail.voteAverage, specifier: "%.1f")")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(.yellow)
                            RatingView()
                        }
                        HStack {
                            Text(movieDetail.overview)
                                .foregroundStyle(Color(uiColor: .systemGray.withAlphaComponent(0.8)))
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 5)
                        Spacer()
                            .frame(height: 100)
                        Button(action: {
                            // Action
                        }) {
                            Text("Watch Now")
                        }
                        .buttonStyle(WatchNowButtonStyle())
                        .padding(.bottom, 30)
                    }
                }
                .onAppear {
                    imageManager.loadImage(url: movieDetail.posterURL)
                }
                .ignoresSafeArea(.all)
            } else {
                ProgressView()
                    .foregroundStyle(.white)
                    .onAppear {
                        viewModel.getMovieDetail(id: selctedMovie.id)
                    }
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(.all)
        .background(Color.appPrimary)
    }
    
    @ViewBuilder
    func PosterImage() -> some View {
        ZStack {
            Image(uiImage: imageManager.image ?? UIImage())
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 450)
                .clipped()
            LinearGradient(colors: [Color.appPrimary.opacity(0.0), Color.appPrimary], startPoint: .top, endPoint: .bottom)
                .frame(height: 200)
                .offset(y: 130)
        }
        .frame(height: 450)
    }
}
