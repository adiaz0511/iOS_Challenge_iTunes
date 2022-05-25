//
//  ContentView.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var albumVM: AlbumViewModel // Model to access the iTunes Search API
    @State var searchText = "Trivecta" // Var that holds the search text
    @State var showAlbum = false // Bool to open the modal with the Album's details
    @State var errorArtist = "" // Text to show when the artist searched yielded no result
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                // If the albums' list isn't empty, show them
                if !albumVM.albums.isEmpty {
                    List(albumVM.albums) { album in
                        Button(action: {
                            albumVM.selectedAlbum = album
                            showAlbum = true
                        }) {
                            // Album Row w/ artwork, title and artist
                            AlbumRow(album: album)
                        }
                        .padding(.vertical, 5)
                        .listRowSeparator(.hidden)

                    }
                    .listStyle(.plain)
                } else {
                    // If the list is empty, show this message
                    Text("No results") + Text(errorArtist != "" ? " for " : "") + Text("\"\(errorArtist)\"")
                    
                }
                
            }
            .searchable(text: $searchText)
            .disableAutocorrection(true)
            .onSubmit(of: .search, { // When the user submits a search, retrieve the albums of the inputed artist
                Task {
                    do {
                        try await albumVM.getAlbums(artist: searchText)
                    } catch {
                        print("Error", error)
                    }
                }
                errorArtist = searchText // sets errorArtist to the searched artist in case there are no results and it needs to be integrated into the error message
            })
            .navigationTitle("Search Albums")
            .sheet(isPresented: $showAlbum) {
                AlbumDetailView()
            }
            .task { // Default search for "Trivecta" (with the option to still search for other artists above)
                Task {
                    do {
                        try await albumVM.getAlbums(artist: "Trivecta")
                    } catch {
                        print("Error", error)
                    }
                }
            }
        }
        .background(Color("Primary"))
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
