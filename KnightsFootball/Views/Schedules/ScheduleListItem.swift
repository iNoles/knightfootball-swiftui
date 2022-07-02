//
//  ScheduleListItem.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/1/22.
//

import SwiftUI

struct ScheduleListItem: View {
    
    private let schedules: Schedules
    
    init(schedules: Schedules) {
        self.schedules = schedules
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(schedules.opponent!).font(.headline)
                Spacer()
                Text(schedules.startDate!).font(.subheadline)
            }
            Text(schedules.location!).font(.subheadline)
        }
    }
}

struct ScheduleListItem_Previews: PreviewProvider {
    static var previews: some View {
        let schedules = Schedules(
            opponent: "USF",
            location: "Bounce House",
            startDate: "Today"
        )
        ScheduleListItem(schedules: schedules)
    }
}
