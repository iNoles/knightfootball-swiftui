//
//  HeadlinesView.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 6/30/22.
//

import SwiftUI

struct HeadlinesView: View {
    @State private var headlines = Headlines(data: [])
    
    var body: some View {
        NavigationView {
            List(headlines.data, id: \.self) {
                HeadlineListItem(data: $0)
            }.navigationTitle("Headlines")
        }.task {
            do {
                let url = URL(string: "https://ucfknights.com/services/archives.ashx/stories?index=1&page_size=30&sport=football&season=0&search=")!
                let (data, _) = try await URLSession.shared.data(from: url)
                headlines = try JSONDecoder().decode(Headlines.self, from: data)
            } catch {
                headlines = Headlines(data: [])
            }
        }
    }
}

struct HeadlinesView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlinesView()
    }
}
