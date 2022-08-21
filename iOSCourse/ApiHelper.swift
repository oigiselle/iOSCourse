//
//  ApiHelper.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-20.
//

import Foundation
import UIKit

class ApiHelper{
    
    enum FetchResults {
        case success(Course)
        case failure(Error)
    }
    
    private static let baseURL =  "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=L0UQW3fymiUNRfko"

    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func fetchCourse(enpoint: String = baseURL) async -> FetchResults{
        guard
            let url = URL(string: enpoint)
        else{return .failure("could not convert URL" as! Error)}
        let request = URLRequest(url: url)
        do{
            let (data,_)  = try await session.data(for: request)
            let decoder = JSONDecoder()
            let results = try decoder.decode(Course.self, from: data)
 
            return .success(results)
        }catch let error {
            return .failure(error)
        }
    }
        
        
  
    
    
 
}
