//
//  SchedulesXMLParser.swift
//  KnightsFootball
//
//  Created by Jonathan Steele on 7/1/22.
//

import Foundation

class SchedulesXMLParser: NSObject, XMLParserDelegate {
    var currentElement = ""
    var foundCharacter = ""
    var currentItem: Schedules?
    var parsedItems = [Schedules]()
    
    private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd / h:mm a"
        return dateFormatter
    }()
    
    private var iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    
    func parseXML(data: Data) {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        
        if currentElement == "item" {
            currentItem = Schedules()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if currentElement == "s:opponent" ||
            currentElement == "ev:location" ||
            currentElement == "ev:startdate" {
            foundCharacter += string.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
        case "item":
            if let currentItem {
                parsedItems.append(currentItem)
            }
            break
        case "s:opponent":
            currentItem?.opponent = foundCharacter
            break
        case "ev:location":
            currentItem?.location = foundCharacter
            break
        case "ev:startdate":
            if let dateString = iso8601Formatter.date(from: foundCharacter) {
                currentItem?.startDate = dateFormatter.string(from: dateString)
            } else {
                currentItem?.startDate = foundCharacter
            }
        default:
            break
        }
        foundCharacter = ""
    }
    
    func parseDate() {
        
    }
}
