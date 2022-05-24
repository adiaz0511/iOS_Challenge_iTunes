//
//  ContentView.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var albumVM: AlbumViewModel
    @State var searchText = ""
    @State var showAlbum = false
    
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
                    Text("No results")
                        .animation(.linear)
                }
                
            }
            .searchable(text: $searchText)
            .disableAutocorrection(true)
            .onSubmit(of: .search, {
                Task {
                    do {
                        try await albumVM.getAlbum(artist: searchText)
                    } catch {
                        print("Error", error)
                    }
                }
            })
            .navigationTitle("Search Albums")
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
