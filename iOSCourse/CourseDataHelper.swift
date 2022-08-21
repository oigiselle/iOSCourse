//
//  CourseData.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-20.
//

import Foundation

struct Course: Codable{
    var results: [CourseData]
}

struct CourseData: Codable {
    let listName, displayName, listNameEncoded, oldestPublishedDate: String
    let newestPublishedDate, updated: String
}


