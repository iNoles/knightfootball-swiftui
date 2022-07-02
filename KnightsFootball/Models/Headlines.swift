//
//  Headlines.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 6/30/22.
//

import Foundation

struct Headlines: Codable {
    let data: [HeadlinesData]
}

struct HeadlinesData: Codable, Hashable {
    let story_created: String
    let story_headline: String
    let story_path: String
    let story_image: String
}
