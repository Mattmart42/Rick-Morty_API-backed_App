import Foundation
import SwiftUI

let RICKAPI_ROOT = "https://rickandmortyapi.com/api"
let CHAR_ENDPOINT = "\(RICKAPI_ROOT)/character"
let LOCATION_ENDPOINT = "\(RICKAPI_ROOT)/location"

enum CharAPIError: Error {
    case characterNotFound
    case unexpectedAPIError
}

enum LocationAPIError: Error {
    case locationNotFound
    case unexpectedAPIError
}

func getChars(name: String) async throws -> [Char] {
    guard let url = URL(string: "\(CHAR_ENDPOINT)/?name=\(name)") else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    let decodedResults = try? JSONDecoder().decode(charResults.self, from: data)
    return decodedResults?.results ?? []
}

func getChar(id: Int) async throws -> Char {
    guard let url = URL(string: "\(CHAR_ENDPOINT)/\(id)") else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedChar = try? JSONDecoder().decode(Char.self, from: data) {
        return decodedChar
    } else {
        throw CharAPIError.characterNotFound
    }
}

func getLocations(name: String) async throws -> [Location] {
    guard let url = URL(string: "\(LOCATION_ENDPOINT)/?name=\(name)") else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    let decodedResults = try? JSONDecoder().decode(locationResults.self, from: data)
    return decodedResults?.results ?? []
}
