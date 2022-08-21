//
//  CourseTableViewController.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-20.
//

import UIKit

class CourseTableViewController: UITableViewController {
    
    var courseList: [CourseData] = []

    @IBOutlet var courseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task{
            let results = await ApiHelper.fetchCourse()
            switch results {
            case .success(let courses):
                courseList = courses.results
                tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
       

    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courseList.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCourse", for: indexPath)
        
        let course = courseList[indexPath.row].listName
     //   let professor = courseList[indexPath.row].director
        cell.textLabel?.text = course
      ///  cell.detailTextLabel?.text = professor

        return cell
    }


}
