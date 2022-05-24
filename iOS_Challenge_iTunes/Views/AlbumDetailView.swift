//
//  AlbumDetailView.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

struct AlbumDetailView: View {
    @EnvironmentObject var albumVM: AlbumViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Album artwork, title, artist, track count and release date
                    AlbumMainInfoItem()
                    
                    // Album price, artist URL and album URL
                    AlbumLinksItem()
                    
                    Spacer()
                    
                    // Album Genre, copyright and country
                    AlbumMiscInfoItem()
                }
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                    }
                }
            }
        }
        .background(Color("Secondary"))
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView()
    }
}
