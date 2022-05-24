//
//  Result+Album.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

import SwiftUI

struct Result: Decodable {
    var resultCount: Int
    var results: [Album]
}

struct Album: Identifiable, Codable {
    var id: Int?
    var wrapperType: String?
    var collectionType: String?
    var artistID: Int?
    var amgArtistID: Int?
    var artistName: String?
    var collectionName: String?
    var collectionCensoredName: String?
    var artistViewURL: String?
    var collectionViewURL: String?
    var artworkUrl60, artworkUrl100: String?
    var collectionPrice: Double?
    var collectionExplicitness: String?
    var trackCount: Int?
    var copyright: String?
    var country: String?
    var currency: String?
    var releaseDate: String
    var primaryGenreName: String?
    
    var formattedPrice: String {
        let result = Double(collectionPrice ?? 0.00)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.string(for: result) ?? ""
    }
    
    var released: String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        if let date = formatter.date(from: self.releaseDate) {
            formatter.dateStyle = .long
            return formatter.string(from: date)
        } else {
            return self.releaseDate
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "collectionId"
        case wrapperType, collectionType
        case artistID = "artistId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
    }
    
    static var defaultAlbum: Album {
        Album(id: Optional(1258806321), wrapperType: Optional("collection"), collectionType: Optional("Album"), artistID: Optional(645420096), amgArtistID: Optional(3131809), artistName: Optional("ILLENIUM"), collectionName: Optional("Fractures (Trivecta Remix) [feat. Nevve] - Single"), collectionCensoredName: Optional("Fractures (Trivecta Remix) [feat. Nevve] - Single"), artistViewURL: Optional("https://music.apple.com/us/artist/illenium/645420096?uo=4"), collectionViewURL: Optional("https://music.apple.com/us/album/fractures-trivecta-remix-feat-nevve-single/1258806321?uo=4"), artworkUrl60: Optional("https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/1a/ee/95/1aee95f3-1559-5eaf-3685-1af9724bdda6/859721956178_cover.jpg/60x60bb.jpg"), artworkUrl100: Optional("https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/1a/ee/95/1aee95f3-1559-5eaf-3685-1af9724bdda6/859721956178_cover.jpg/100x100bb.jpg"), collectionPrice: Optional(0.99), collectionExplicitness: Optional("notExplicit"), trackCount: Optional(1), copyright: Optional("℗ 2017 Seeking Blue / Kasaya"), country: Optional("USA"), currency: Optional("USD"), releaseDate: Optional("2017-07-17T07:00:00Z")!, primaryGenreName: Optional("Electronic"))
    }
}

