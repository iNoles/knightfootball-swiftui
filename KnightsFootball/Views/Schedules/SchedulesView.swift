//
//  SchedulesView.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/1/22.
//

import SwiftUI

struct SchedulesView: View {
    @ObservedObject var viewModel = SchedulesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.schedules, id: \.self) { schedule in
                ScheduleListItem(schedules: schedule)
            }.navigationTitle("Schedules")
        }.onAppear {
            viewModel.parseSchedules()
        }
    }
}

struct SchedulesView_Previews: PreviewProvider {
    static var previews: some View {
        SchedulesView()
    }
}
