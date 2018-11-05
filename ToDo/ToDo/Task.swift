//
//  Task.swift
//  ToDo
//
//  Created by Juan Angeles on 11/1/18.
//  Copyright © 2018 Juan Angeles. All rights reserved.
//

import Foundation

class Task: Codable {
    var title:String
    var done: Bool
    
    init(_ title:String){
        self.title = title
        self.done = false
    }
    
    init(_ title:String, _ done:Bool){
        self.title = title
        self.done = done
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case done
    }
    
    // Decodable protocol adherence
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        done = try values.decode(Bool.self, forKey: .done)

    }
    
    // Encodable protocol adherence
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(done, forKey: .done)
    }
}

extension Task {
    class func sampleTasks() -> [Task] {
        return[
            Task("Study for midterm"),
            Task("Finish CSC690 Project")
        ]
    }
}
