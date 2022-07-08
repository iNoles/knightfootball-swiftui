//
//  SidebarMainView.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/5/22.
//

import SwiftUI

struct SidebarMainView: View {
    var body: some View {
        NavigationView {
            SidebarView()
        }
    }
}

struct SidebarView: View {
    var body: some View {
        List {
            ForEach(TabModel.views, id: \.title) { model in
                NavigationLink(destination: model.destination) {
                    Label(model.title, systemImage: model.image)
                }
                
            }
            
        }
        .listStyle(SidebarListStyle())
    }
}

struct SidebarMainView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
