//
//  ContentView.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 6/23/22.
//

import SwiftUI

struct TabMainView: View {
    var body: some View {
        TabView {
            ForEach(TabModel.views, id: \.title) { model in
                model.destination
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: model.image)
                        Text(model.title.uppercased())
                    }
            }
        }
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
