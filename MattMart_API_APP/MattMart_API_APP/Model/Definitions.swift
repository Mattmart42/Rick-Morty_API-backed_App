import Foundation
import SwiftUI

struct charResults: Hashable, Codable {
    let results: [Char]
}

struct locationResults: Hashable, Codable {
    let results: [Location]
}

struct Char: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var image: String
}

struct Location: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var type: String
    var dimension: String
}
