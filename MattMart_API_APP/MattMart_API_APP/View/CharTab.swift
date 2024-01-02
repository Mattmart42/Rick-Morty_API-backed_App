//
//  Content.swift
//  MattMart_API_APP
//
//  Created by keckuser on 3/13/23.
//

import SwiftUI

struct CharRow: View {
    
    var char: Char
    
    var body: some View {
        HStack {
            CharImage(imageUrl: char.image)
                .scaledToFill()
                .frame(width: 70, height: 70)
            Text("   " + char.name)
        }
    }
}

struct CharImage: View {
    
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
        } placeholder: {
            ProgressView()
        }
    }
}

struct CharView: View {
    
    @StateObject private var charListVM = CharListViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List(charListVM.chars, id: \.id) { char in
                NavigationLink(destination: CharProfile(char: char.char),
                               label: {
                    CharRow(char: char.char)
                })
            }.listStyle(.plain)
                .searchable(text: $searchText)
                .autocorrectionDisabled()
                .onChange(of: searchText) { value in
                    Task {
                        if !value.isEmpty && value.count > 3 {
                            await charListVM.search(name: value)
                        } else {
                            charListVM.chars.removeAll()
                        }
                    }
                }.navigationTitle("Characters")
        }
    }
}

struct CharView_Previews: PreviewProvider {
    static var previews: some View {
        CharView()
    }
}
