//
//  ContentView.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 20/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = MovieVM()
    @State var showDetail = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.label]
   }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.movies, id: \.id) { movie in
                        MovieView(movie: movie)
                            .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .listRowBackground(Color.clear)
                            .listRowSeparatorTint(Color(uiColor: .darkGray.withAlphaComponent(0.3)))
                            .listStyle(.plain)
                            .onTapGesture {
                                viewModel.selectedMovie = movie
                                showDetail = true
                            }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color(uiColor: .systemBackground))
                }
            }
            .navigationTitle("Now Playing")
            .onAppear {
                viewModel.getMovies()
            }
        }
        .sheet(isPresented: $showDetail, content: {
            if let movie = viewModel.selectedMovie {
                MovieDetailView(selctedMovie: movie)
            }
        })
    }
}

#Preview {
    HomeView()
}
