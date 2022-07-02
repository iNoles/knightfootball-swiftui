//
//  RostersViewModel.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/1/22.
//

import Foundation
import Combine

class RostersViewModel : ObservableObject {
    private var loadCancellable: Cancellable?
    
    @Published private(set) var rosters = Rosters(players: [], coaches: [])
    
    func parsePlayers() {
        let url = URL(string: "https://ucfknights.com/sports/football/roster")!
        loadCancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { (data, _) -> Rosters in
                return parseRostersDOM(data: data)
            }
            .replaceError(with: Rosters(players: [], coaches: []))
            .receive(on: RunLoop.main)
            .assign(to: \.rosters, on: self)
    }
}
