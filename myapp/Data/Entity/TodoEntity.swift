//
//  TodoEntity.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation
import ObjectMapper

struct TodoesEntity: Mappable {
    var items: [TodoEntity] = []
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        self.items <- map["items"]
    }
}

struct TodoEntity: Mappable {
    var id: String!
    var title: String!
    var complete: Bool!
    
    init?(map: Map) { }
    init(model: TodoModel) {
        self.id = model.id
        self.title = model.title
        self.complete = model.complete
    }
    
    mutating func mapping(map: Map) {
        self.id       <- map["id"]
        self.title    <- map["title"]
        self.complete <- map["complete"]
    }
}
