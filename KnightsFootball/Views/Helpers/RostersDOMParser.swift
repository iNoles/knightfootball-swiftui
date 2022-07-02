//
//  RostersDOMParser.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/1/22.
//

import Foundation
import SwiftSoup

func parseRostersDOM(data: Data) -> Rosters {
    let html = String(data: data, encoding: String.Encoding.utf8)!
    var rosters = Rosters(players: [], coaches: [])
    do {
        let doc: Document = try SwiftSoup.parse(html)
        let playerTR = try doc.select("div.sidearm-roster-grid-template-1 > table > tbody > tr")
        try playerTR.forEach {
            rosters.players.append(Players(
                number: try $0.select("td.roster_jerseynum ").text(),
                name: try $0.select("td.sidearm-table-player-name").text(),
                position: try $0.select("td.rp_position_short ").text()
            ))
        }
        let coachesTR = try doc.select("div.row.collapse div table tbody tr")
        try coachesTR.forEach {
            let td = try $0.select("td")
            rosters.coaches.append(Coaches(
                name: try td[1].text(),
                postion: try td[2].text()
            ))
        }
    } catch {
        print(error)
    }
    return rosters
}
