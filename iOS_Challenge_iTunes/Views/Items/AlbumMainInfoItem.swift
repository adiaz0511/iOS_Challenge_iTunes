//
//  AlbumMainInfoItem.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

// Album artwork, title, artist, track count and release date
struct AlbumMainInfoItem: View {
    @EnvironmentObject var albumVM: AlbumViewModel

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            AsyncImage(
                url: URL(string: albumVM.selectedAlbum.artworkUrl100 ?? ""),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 15)
                },
                placeholder: {
                    ProgressView()
                })
            
            VStack(alignment: .leading, spacing: 10) {
                Text(albumVM.selectedAlbum.collectionName ?? "No name")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(albumVM.selectedAlbum.artistName ?? "No name")
                    
                    Text("\(albumVM.selectedAlbum.trackCount ?? 0) ") + Text(albumVM.selectedAlbum.trackCount ?? 0 > 1 ? "songs" : "song")
                    
                    Text("released ") + Text(albumVM.selectedAlbum.released)
                    
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}

struct AlbumMainInfoItem_Previews: PreviewProvider {
    static var previews: some View {
        AlbumMainInfoItem()
    }
}

