//
//  AstronautView.swift
//  Moonshot
//
//  Created by Kamol Madaminov on 30/03/25.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astrounaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
            
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronaut: [String: Astrounaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronaut["aldrin"]!)
        .preferredColorScheme(.dark)
}
