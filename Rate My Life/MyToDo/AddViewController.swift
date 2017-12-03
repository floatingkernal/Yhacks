//
//  AddViewController.swift
//  MyToDo
//
//  Created by Salman Sharif on 2017-12-03.
//  Copyright © 2017 Bruno Philipe. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    

    @IBOutlet weak var Start: UITextField!
    @IBOutlet weak var End: UITextField!
    
    
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var rateSlider: UISlider!
    private var rate = 0
    
    @IBAction func toggle(_ sender: UISwitch) {
        if sender.isOn {
            state.text = "You are Picking from Jet Blue flights"
        } else {
            state.text = "You are currently picking from Custom criteria"
        }
    }
    @IBAction func Save(_ sender: Any) {
        if toggle.isOn {
            if addNewFromDeals() {
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            addNewToDoItem(title: name.text!, rate: rate)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func rate(_ sender: UISlider) {
        rate = Int(sender.value)
        label.text = "You are rating this as " + String(rate)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Parse(numberDeparture: "YZF", numberDestination: "YZF")
        // Do any additional setup after loading the view.
        rate = Int(rateSlider.value)
        label.text = "You are rating this as " + String(rate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addNewToDoItem(title: String, rate:Int)
    {
        // The index of the new item will be the current item count
        let newIndex = todoItems.count
        
        // Create new item and add it to the todo items list
        todoItems.append(ToDoItem(title: title))
        rates.append(rate)
        
        // Tell the table view a new row has been created
//        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
    }
    private func addNewFromDeals() -> Bool{
        if airports.contains(Start.text!) && airports.contains(End.text!) && Start.text != End.text {
            var rate = Parse(numberDeparture: Start.text!, numberDestination: End.text!)
            var title = "Your flight from \(Start.text!) to \(End.text!)"
            todoItems.append(ToDoItem(title: title))
            rates.append(rate/100)
            return true
        } else if Start.text == End.text {
            let alert = UIAlertController(title: "Error!", message: "Start and End cannot be the same and You must pick from the following airports", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        } else {
            let alert = UIAlertController(title: "Error! You must pick from the following airports", message: airports.description, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
