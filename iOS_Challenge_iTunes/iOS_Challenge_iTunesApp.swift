//
//  iOS_Challenge_iTunesApp.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

@main
struct iOS_Challenge_iTunesApp: App {
    var albumViewModel = AlbumViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(albumViewModel)
        }
    }
}
