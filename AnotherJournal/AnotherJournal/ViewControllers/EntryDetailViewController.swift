//
//  EntryDetailViewController.swift
//  AnotherJournal
//
//  Created by Austin West on 6/2/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    var entry: Entry? {
        didSet {
            if isViewLoaded { updateViews() }
        }
    }
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    //     Pressing the remove button sets the title and body text to empty/nothing
    @IBAction func removeButtonTapped(_ sender: Any) {
        
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleTextField.text, let text = bodyTextView.text else { return }
        
        if let entry = self.entry {
            EntryController.shared.update(entry: entry, with: title, text: text)
        } else {
            EntryController.shared.addEntryWith(title: title, text: text)
        }
        
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    private func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
