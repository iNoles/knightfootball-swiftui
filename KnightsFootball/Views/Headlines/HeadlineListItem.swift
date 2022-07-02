//
//  HeadlineDataView.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 6/30/22.
//

import SwiftUI
import URLImage

struct HeadlineListItem: View {
    private let data: HeadlinesData
    
    init(data: HeadlinesData) {
        self.data = data
    }
    
    var body: some View {
        HStack {
            URLImage(URL(string: "https://ucfknights.com\(data.story_image)")!) { image in
                image.resizable()
                    .frame(width: 64.0, height: 64.0)
            }
            VStack(alignment: .leading) {
                Text(data.story_headline).font(.headline)
                Text(data.story_created).font(.subheadline)
            }
        }
    }
}

struct HeadlineListItem_Previews: PreviewProvider {
    static var previews: some View {
        let data = HeadlinesData(
            story_created: "Today",
            story_headline: "UCF Won",
            story_path: "https://ucfknights.com",
            story_image: "/images/2022/6/14/3MG.jpg"
        )
        HeadlineListItem(data: data)
    }
}
