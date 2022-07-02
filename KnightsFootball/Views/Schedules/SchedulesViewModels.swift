//
//  SchedulesViewModels.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/1/22.
//

import Foundation
import Combine

class SchedulesViewModel : ObservableObject {
    private var loadCancellable: Cancellable?
    
    @Published private(set) var schedules = [Schedules]()

    func parseSchedules() {
        let url = URL(string: "https://ucfknights.com/calendar.ashx/calendar.rss?sport_id=2&=cl4j8ot2n00013g9rx5bxrlh1")!
        loadCancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { (data, _) -> [Schedules] in
                let parser = SchedulesXMLParser()
                parser.parseXML(data: data)
                return parser.parsedItems
            }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.schedules, on: self)
    }
}
