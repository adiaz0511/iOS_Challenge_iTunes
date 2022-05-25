//
//  AlbumLinksItem.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

// Album price, artist URL and album URL
struct AlbumLinksItem: View {
    @EnvironmentObject var albumVM: AlbumViewModel // Model to access the iTunes Search API

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Divider()
                .padding(.horizontal)
            
            HStack {
                Spacer()
                
                Text("price: ") + Text("$\(albumVM.selectedAlbum.formattedPrice) USD")
                
                Spacer()
            }
            .padding()
            .dashedBoxedFrame(bgColor: Color("Purple"), radius: 15)
            .padding(10)
            
            Divider()
                .padding(.horizontal)
            
            HStack(alignment: .center, spacing: 15) {
                Button(action: {}) {
                    Link(destination: URL(string: "\(albumVM.selectedAlbum.artistViewURL ?? "https://music.apple.com/")")!, label: {
                        
                        HStack(alignment: .center, spacing: 5) {
                            Spacer()
                            Image(systemName: "music.mic")
                            Text("artist-button")
                            Spacer()
                        }
                    })
                }
                .buttonStyle(BouncyButton(color: LinearGradient(colors: [Color(#colorLiteral(red: 1, green: 0.662745098, blue: 0.6431372549, alpha: 1)), Color(#colorLiteral(red: 0.9019607843, green: 0.5058823529, blue: 0.8470588235, alpha: 1)), Color(#colorLiteral(red: 0.5450980392, green: 0.6235294118, blue: 0.9098039216, alpha: 1)), Color(#colorLiteral(red: 0.2360135019, green: 0.8071150184, blue: 0.9634385705, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing), cornerRadius: 15, shadowColor: Color("Purple"), shadowOpacity: 0.3))
                
                Button(action: {}) {
                    Link(destination: URL(string: "\(albumVM.selectedAlbum.collectionViewURL ?? "https://music.apple.com/")")!, label: {
                        
                        HStack(alignment: .center, spacing: 5) {
                            Spacer()
                            Image(systemName: "square.stack")
                            Text("album-button")
                            Spacer()
                        }
                    })
                }
                .buttonStyle(BouncyButton(color: LinearGradient(colors: [Color(#colorLiteral(red: 1, green: 0.662745098, blue: 0.6431372549, alpha: 1)), Color(#colorLiteral(red: 0.9019607843, green: 0.5058823529, blue: 0.8470588235, alpha: 1)), Color(#colorLiteral(red: 0.5450980392, green: 0.6235294118, blue: 0.9098039216, alpha: 1)), Color(#colorLiteral(red: 0.2360135019, green: 0.8071150184, blue: 0.9634385705, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing), cornerRadius: 15, shadowColor: Color("Purple"), shadowOpacity: 0.3))
            }
            .font(.subheadline)
            .foregroundColor(.primary)
            .padding(.horizontal, 20)
            .padding(.vertical)
            
            Divider()
                .padding(.horizontal)
        }
    }
}

struct AlbumLinksItem_Previews: PreviewProvider {
    static var previews: some View {
        AlbumLinksItem()
    }
}

