//
//  EntryListTableViewController.swift
//  AnotherJournal
//
//  Created by Austin West on 6/1/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           let ec = EntryController.shared
            let entry = ec.entries[indexPath.row]
            ec.remove(entry: entry)
            
//            Actual action that deletes the row from table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        if segue.identifier == "toShowEntry" {
            
            if let detailViewController = segue.destination as?
            EntryDetailViewController,
                let selectedRow = tableView.indexPathForSelectedRow?.row {
                
                let entry = EntryController.shared.entries[selectedRow]
                detailViewController.entry = entry
            }
        }
    }
}
