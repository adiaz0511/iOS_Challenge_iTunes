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
            VStack(alignment: .leading, spacing: 0) {
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
                }
                
                Spacer()
                
                Divider()
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(albumVM.selectedAlbum.primaryGenreName ?? "No genre")
                    
                    Text("\(albumVM.selectedAlbum.copyright ?? "No label") ·  \(albumVM.selectedAlbum.country ?? "No country")")
                }
                .foregroundColor(.secondary)
                .font(.subheadline)
                .padding()
                
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
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView()
    }
}
