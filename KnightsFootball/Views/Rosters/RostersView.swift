//
//  RostersView.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/1/22.
//

import SwiftUI

struct RostersView: View {
    @State private var favoriteOptions = 0
    @ObservedObject var viewModel = RostersViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Choose options", selection: $favoriteOptions) {
                    Text("Player").tag(0)
                    Text("Coaches").tag(1)
                }.pickerStyle(.segmented)
                
                if (favoriteOptions == 0) {
                    List(viewModel.rosters.players, id: \.self) { player in
                        HStack {
                            Text(player.number)
                            VStack(alignment: .leading) {
                                Text(player.name).font(.headline)
                                Text(player.position).font(.subheadline)
                            }
                        }
                    }
                } else if (favoriteOptions == 1) {
                    List(viewModel.rosters.coaches, id: \.self) { coach in
                        VStack(alignment: .leading) {
                            Text(coach.name).font(.headline)
                            Text(coach.postion).font(.subheadline)
                        }
                    }
                }
            }.navigationTitle("Rosters")
        }.onAppear {
            viewModel.parsePlayers()
        }
    }
}

struct RostersView_Previews: PreviewProvider {
    static var previews: some View {
        RostersView()
    }
}
