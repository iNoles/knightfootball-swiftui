//
//  KnightsFootballApp.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 6/23/22.
//

import SwiftUI

@main
struct KnightsFootballApp: App {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
#endif
    var body: some Scene {
        WindowGroup {
#if os(macOS)
            SidebarMainView().frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
#else
            if horizontalSizeClass == .compact {
                TabMainView()
            } else {
                SidebarMainView().navigationBarTitle("Knights Football")
            }
#endif
        }
    }
}
