//
//  ViewController.swift
//  Shopping List
//
//  Created by admin on 7/22/20.
//  Copyright © 2020 Shanice Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var shoppingTableView: UITableView!
    
    var items = ["apples","bananas","grapes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
  
    // Add a new line
    @IBAction func addButtonPressed(_ sender: Any) {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add New Item", style: .default)
        { (action) in
            self.items.append(textfield.text!)
            self.shoppingTableView.reloadData()
        
           
    }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new item"
            textfield = alertTextField
        }
    
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
}
    // Delete an item
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            items.remove(at: indexPath.item)
            shoppingTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedCell = items[sourceIndexPath.item]
        items.remove(at: sourceIndexPath.item)
        items.insert(movedCell, at: destinationIndexPath.item)
    }
    // Add edit function
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        self.shoppingTableView.isEditing = !self.shoppingTableView.isEditing
        
        sender.title = (self.shoppingTableView.isEditing) ? "Done" : "Edit"
        
        
    }
}
