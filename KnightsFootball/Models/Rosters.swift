//
//  Rosters.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/1/22.
//

import Foundation

struct Rosters : Hashable
{
    var players: [Players]
    var coaches: [Coaches]
}

struct Players : Hashable
{
    let number: String
    let name: String
    let position: String
}

struct Coaches: Hashable
{
    let name: String
    let postion: String
}
