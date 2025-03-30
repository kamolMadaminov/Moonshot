//
//  ContentView.swift
//  Moonshot
//
//  Created by Kamol Madaminov on 29/03/25.
//

import SwiftUI

struct ContentView: View {
    let astrounauts: [String: Astrounaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var isGridView = true
    
    @State private var columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(missions){ mission in
                        NavigationLink{
                            MissionView(mission: mission, astronaut: astrounauts)
                        } label: {
                            VStack{
                                Image(mission.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
                Button("Change layout"){
                    switchLayout()
                }
                .font(.headline)
                .foregroundStyle(.white)
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
    
    func switchLayout() {
        if isGridView {
            columns = [
                GridItem(.adaptive(minimum: 150))
            ]
        } else {
            columns = [
                GridItem(.adaptive(minimum: 300))
            ]
        }
        self.isGridView = !self.isGridView
    }
}

#Preview {
    ContentView()
}
