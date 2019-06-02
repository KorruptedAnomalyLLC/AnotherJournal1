//
//  EntryController.swift
//  AnotherJournal
//
//  Created by Austin West on 6/1/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class EntryController {
    
    //    Entries array property with an empty array
    private(set) var entries = [Entry]()
    //    Drawing from EntryController
    static let shared = EntryController()
    
    //  CRUD
    
    //    Adding a title and text
    func addEntryWith(title: String, text: String) {
        //        declaring a constant entry to = the model Entry's title and bodyText
        let entry = Entry(title: title, bodyText: text)
        //        Officially adding/appending to the entries array
        entries.append(entry)
    }
    
    //  Remove entry from entries array
    func remove(entry: Entry) {
        
        if let entryIndex = entries.index(of: entry) {
            entries.remove(at: entryIndex)
        }
    }
  
    func update(entry: Entry, with title: String, text: String) {
        
        entry.title = title
        entry.bodyText = text
        
        
    }
    
    
    
    
}



