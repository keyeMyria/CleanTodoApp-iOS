//
//  TodoModel.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation

struct TodoesModel {
    var items: [TodoModel] = []
}

struct TodoModel {
    let id: String
    let title: String
    var complete: Bool
    
    init(entity: TodoEntity) {
        self.id = entity.id
        self.title = entity.title
        self.complete = entity.complete
    }
    
    init(fragment: TodoDetails) {
        self.id = fragment.id
        self.title = fragment.text
        self.complete = fragment.complete
    }
    
    init(id: String, title: String, complete: Bool) {
        self.id = id
        self.title = title
        self.complete = complete
    }
}
