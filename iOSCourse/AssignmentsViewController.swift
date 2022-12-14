//
//  AssignmentsViewController.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-18.
//

import UIKit
import CoreData

class AssignmentsViewController: UIViewController {
  
    @IBOutlet weak var assignmentsTable: UITableView!
    
    
    var assignmentsList: [Assignments] = []
    
    //reference to core data container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignmentsTable.delegate = self
        assignmentsTable.dataSource = self
        read()
 
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addAssignment(_ sender: Any) {
        var assignmentName = UITextField()
        
        let alert = UIAlertController(title: "New", message: "Assignment", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            
            let newAssigment = Assignments(context: self.context)
            newAssigment.name = assignmentName.text
            newAssigment.complete = false
            self.assignmentsList.append(newAssigment)
            
            self.save()
            
        }
        
        alert.addTextField{ textFieldAlert in
            textFieldAlert.placeholder = "Insert your assignment description here."
            assignmentName = textFieldAlert
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
        
    }
    
    
    func save(){
        do {
            try context.save()
        } catch  {
            print(error.localizedDescription)
        }
        assignmentsTable.reloadData()
    }
    
    func read(){
        let request : NSFetchRequest<Assignments> = Assignments.fetchRequest()
        do {
            assignmentsList = try context.fetch(request)
        } catch  {
            (error.localizedDescription)
        }
        
    }
    
}

extension AssignmentsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignmentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assignmentsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let assignment = assignmentsList[indexPath.row]
        
        cell.textLabel?.text = assignment.name
        cell.textLabel?.textColor = assignment.complete ? .black : .blue
        
        cell.detailTextLabel?.text = assignment.complete ? "Done" : "To Do"
        
        cell.accessoryType = assignment.complete ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if assignmentsTable.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            assignmentsTable.cellForRow(at: indexPath)?.accessoryType = .none
        } else{
            assignmentsTable.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //edit coredata
        
        assignmentsList[indexPath.row].complete = !assignmentsList[indexPath.row].complete
        
        save()
        
        assignmentsTable.deselectRow(at: indexPath, animated: true)
    }
    

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAssignment = UIContextualAction(style: .normal, title: "Delete") { [self]_, _, _ in
            
            context.delete(assignmentsList[indexPath.row])
            assignmentsList.remove(at: indexPath.row)
            save()
        }
        deleteAssignment.backgroundColor = .red
            return UISwipeActionsConfiguration(actions: [deleteAssignment])
    }
    
    
    
    
    
}
