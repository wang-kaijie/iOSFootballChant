//
//  Untitled.swift
//  FootballChants
//
//  Created by ByteDance on 23/5/25.
//

import Foundation

enum JobTye: String{
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager{
    let name: String
    let job: JobTye
}
