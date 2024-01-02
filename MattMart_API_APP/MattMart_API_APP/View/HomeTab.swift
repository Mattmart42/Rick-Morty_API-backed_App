//
//  HomeTab.swift
//  MattMart_API_APP
//
//  Created by keckuser on 3/14/23.
//

import SwiftUI

struct HomeTab: View {
    
    @EnvironmentObject var modelData: CharListViewModel
    @State var char: Char?
    @State var loading = false
    var bounds = UIScreen.main.bounds
    
    func randomChar() async {
        let randomId = Int.random(in: 1...827)
        loading = true
        do {
            let loadedChar = try await getChar(id: randomId)
            loading = false
            char = loadedChar
            return
        } catch {
            // No-op: we’ll try again.
        }
    }
    
    var body: some View {
        
        let width = bounds.size.width
        
        NavigationView {
            ZStack() {
                Image("RMlogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width-40)
                    .padding(.top, -350)
                RoundedRectangle(cornerRadius: 120, style: .continuous)
                    .fill(.black)
                    .frame(width: 340, height: 340)
                    .padding(.top, -132)
                if loading {
                    ProgressView()
                } else if let rando = char {
                    NavigationLink(destination: CharProfile(char: rando)) { CharImage(imageUrl: rando.image)
                            .frame(width: 300.0, height: 300.0)
                            .cornerRadius(100)
                            .padding(.top, -132)
                    }
                    NavigationLink(destination: CharProfile(char: rando)) {
                        Text(rando.name)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(.black))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .padding(.top, 350)
                    }
                }
                Button("Press Me!") {
                    Task {
                        await randomChar()
                    }
                }.disabled(loading)
                    .padding()
                    .background(Color(.black))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding(.top, 530)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                Image("RMbackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab(char: Char(
            id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
    }
}
