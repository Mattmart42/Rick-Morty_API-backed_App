//
//  LocationProfile.swift
//  MattMart_API_APP
//
//  Created by keckuser on 3/15/23.
//

import SwiftUI

struct LocationProfile: View {
    
    @EnvironmentObject var modelData: CharListViewModel
    var location: Location
    var bounds = UIScreen.main.bounds
    
    var body: some View {
        
        let width = bounds.size.width
        let height = bounds.size.height
        
        ZStack() {
            RoundedRectangle(cornerRadius: 120, style: .continuous)
                .fill(.black)
                .frame(width: width * 0.28, height: height * 0.05)
                .padding(.top, -405)
                .padding(.leading, -192)
            Image("RMlogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width-40)
                .padding(.top, -350)
            RoundedRectangle(cornerRadius: 180, style: .continuous)
                .fill(.white)
                .frame(width: 360, height: 360)
            RoundedRectangle(cornerRadius: 180, style: .continuous)
                .fill(.green)
                .frame(width: 330, height: 330)
            RoundedRectangle(cornerRadius: 180, style: .continuous)
                .fill(.black)
                .frame(width: 315, height: 315)
            VStack() {
                Text(location.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 300)
                Text(location.type)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 300)
                Text(location.dimension)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 300)
                
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

struct LocationProfile_Previews: PreviewProvider {
    static var previews: some View {
        LocationProfile(location: Location(
            id: 1, name: "Earth", type: "Planet", dimension: "Dimension C-137"))
    }
}
