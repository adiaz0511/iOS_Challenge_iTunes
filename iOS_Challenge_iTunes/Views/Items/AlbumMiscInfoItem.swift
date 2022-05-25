//
//  AlbumMiscInfoItem.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

// Album Genre, copyright and country
struct AlbumMiscInfoItem: View {
    @EnvironmentObject var albumVM: AlbumViewModel // Model to access the iTunes Search API

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Genre: ") + Text(albumVM.selectedAlbum.primaryGenreName ?? "No genre") 
            
            Text("\(albumVM.selectedAlbum.copyright ?? "No label") ·  \(albumVM.selectedAlbum.country ?? "No country")")
        }
        .foregroundColor(.secondary)
        .font(.subheadline)
        .padding()
    }
}

struct AlbumMiscInfoItem_Previews: PreviewProvider {
    static var previews: some View {
        AlbumMiscInfoItem()
    }
}
