//
//  ProfileView.swift
//  MattMart_API_APP
//
//  Created by keckuser on 3/13/23.
//

import SwiftUI

struct CharProfile: View {
    
    @EnvironmentObject var modelData: CharListViewModel
    var char: Char
    var bounds = UIScreen.main.bounds
    @State var loading = false
    
    var body: some View {
        let width = bounds.size.width
        let height = bounds.size.height
        
        ZStack() {
            RoundedRectangle(cornerRadius: 120, style: .continuous)
                .fill(.black)
                .frame(width: width * 0.30, height: height * 0.05)
                .padding(.top, -405)
                .padding(.leading, -192)
            Image("RMlogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width-40)
                .padding(.top, -350)
            RoundedRectangle(cornerRadius: 120, style: .continuous)
                .fill(.black)
                .frame(width: 340, height: 340)
                .padding(.top, -132)
            CharImage(imageUrl: char.image)
                .frame(width: 300.0, height: 300.0)
                .cornerRadius(100)
                .padding(.top, -132)
            Text(char.name)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color(.black))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding(.top, 350)
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.black)
                .frame(width: width * 0.95, height: height * 0.1)
                .padding(.top, height - 320)
            Text("Status         Species         Gender")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.top, 500)
            HStack() {
                Text(char.status + " ")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 570)
                Text(char.species + " ")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 570)
                Text(char.gender + " ")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 570)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            Image("RMbackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct CharProfile_Previews: PreviewProvider {
    static var previews: some View {
        CharProfile(char: Char(
            id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
    }
}
