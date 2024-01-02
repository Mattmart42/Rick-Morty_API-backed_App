//
//  CharListViewModel.swift
//  MattMart_API_APP
//
//  Created by keckuser on 3/13/23.
//

import Foundation

@MainActor
class CharListViewModel: ObservableObject {
    
    @Published var chars: [CharViewModel] = []
    
    func search(name: String) async {
        do {
            let chars = try await getChars(name: name)
            self.chars = chars.map(CharViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct CharViewModel {
    let char: Char
    var id: Int {char.id }
    var name: String {char.name}
    var status: String {char.status}
    var species: String {char.species}
    var gender: String {char.gender}
    var image: URL? {URL(string: char.image)}
}

@MainActor
class LocationListViewModel: ObservableObject {
    
    @Published var locations: [LocationViewModel] = []
    
    func search(name: String) async {
        do {
            let locations = try await getLocations(name: name)
            self.locations = locations.map(LocationViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct LocationViewModel {
    let location: Location
    var id: Int {location.id}
    var name: String {location.name}
    var type: String {location.type}
    var dimension: String {location.dimension}
}
