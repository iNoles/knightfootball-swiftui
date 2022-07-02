//
//  ContentView.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 6/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HeadlinesView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "square.stack.fill")
                    Text("Headlines")
                }
             
            SchedulesView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("Schedules")
                }
             
            RostersView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Rosters")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
