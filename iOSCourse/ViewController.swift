//
//  ViewController.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    

    
    
    @IBOutlet weak var coursesTableView: UITableView!
    var fetchedCourse = [CourseData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        coursesTableView.dataSource.self
        parseData()

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedCourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    func parseData(){
        
        fetchedCourse = []
        let url = "https://owen-wilson-wow-api.herokuapp.com/wows/random?results=5"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print("Error")
            }else{
                do {
                    let fetchedData =
                    try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    
                    for i in fetchedData {
                        let eachCourse = i as! [String : Any]
                        let course = eachCourse["movie"] as! String
                        let professor = eachCourse["director"] as! String
                        let description = eachCourse["full_line"] as! String
                        
                        self.fetchedCourse.append(CourseData(movie: course, director: professor, full_line: description))
                    }
                    
                } catch  {
                    print("error")
                }
            }
        }
        task.resume()
    }
    

}



