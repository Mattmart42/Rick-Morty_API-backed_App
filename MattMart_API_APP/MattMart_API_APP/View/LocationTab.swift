//
//  Content.swift
//  MattMart_API_APP
//
//  Created by keckuser on 3/13/23.
//

import SwiftUI

struct LocationRow: View {
    
    var location: Location
    
    var body: some View {
        HStack {
            Text(location.name)
        }
    }
}

struct LocationView: View {
    
    @StateObject private var locationListVM = LocationListViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List(locationListVM.locations, id: \.id) { location in
                NavigationLink(destination: LocationProfile(location: location.location),
                               label: {
                    LocationRow(location: location.location)
                })
            }.listStyle(.plain)
                .searchable(text: $searchText)
                .autocorrectionDisabled()
                .onChange(of: searchText) { value in
                    Task {
                        if !value.isEmpty && value.count > 3 {
                            await locationListVM.search(name: value)
                        } else {
                            locationListVM.locations.removeAll()
                        }
                    }
                }.navigationTitle("Locations")
                 .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
