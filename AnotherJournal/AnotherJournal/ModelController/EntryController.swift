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
    
    init() {
        loadFromPersistentStorage()
    }
    
    //  CRUD
    
    //    Adding a title and text
    func addEntryWith(title: String, text: String) {
        //        declaring a constant entry to = the model Entry's title and bodyText
        let entry = Entry(title: title, bodyText: text)
        //        Officially adding/appending to the entries array
        entries.append(entry)
        
        saveToPersistentStorage()
    }
    
    //  Remove entry from entries array
    func remove(entry: Entry) {
        
        if let entryIndex = entries.firstIndex(of: entry) {
            entries.remove(at: entryIndex)
        }
    }
    
    func update(entry: Entry, with title: String, text: String) {
        
        entry.title = title
        entry.bodyText = text
        saveToPersistentStorage()
    }
    
    
    //  Persistence
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "journal.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    private func saveToPersistentStorage() {
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(entries)
            try data.write(to:fileURL())
        } catch let error {
            print("There was an error saving to persistent storage: \(error)")
        }
    }
    
    private func loadFromPersistentStorage() {
        
        let decoder = JSONDecoder()
        do{
            let data = try Data(contentsOf: fileURL())
            let entries = try decoder.decode([Entry].self, from: data)
            self.entries = entries
        } catch let error {
            print("There was an error saving to persistent storage: \(error)")
        }
    }
    
    
    
}



