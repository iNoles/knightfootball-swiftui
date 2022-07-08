//
//  TabModel.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/5/22.
//

import SwiftUI

struct TabModel {
    var title: String
        var image: String
        var destination: AnyView

        init<V>(title: String, image: String, destination: V) where V: View {
            self.title = title
            self.image = image
            self.destination = AnyView(destination)
        }

        static var views: [TabModel] {
            let models = [
                TabModel(title: "Headlines", image: "square.stack.fill", destination: HeadlinesView()),
                TabModel(title: "Schedules", image: "clock.fill", destination: SchedulesView()),
                TabModel(title: "Rosters", image: "star.fill", destination: RostersView())
            ]
            return models
        }
}
