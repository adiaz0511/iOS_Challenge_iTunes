//
//  AlbumViewModel.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

// MARK: AlbumViewModel
class AlbumViewModel: ObservableObject {
    @Published var albums = [Album]() // List of albums from a given artist
    @Published var selectedAlbum = Album.defaultAlbum // Holds the album that the user selects from the list to see its details
    
    // Retrieves the given albums of the specified artist
    func getAlbums(artist: String) async throws {
        let artistName = artist.replacingOccurrences(of: " ", with: "+") // Replace spaces with '+'
        let albumURL = "https://itunes.apple.com/search?term=" + artistName + "&entity=album"
        guard let url = URL(string: albumURL) else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedResult = try JSONDecoder().decode(Result.self, from: data)
        
        DispatchQueue.main.async {
            self.albums = decodedResult.results
        }
    }
}
