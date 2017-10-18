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
    let title: String
    let complete: Bool
    
    init(entity: TodoEntity) {
        self.title = entity.title
        self.complete = entity.complete
    }
    
    init(fragment: TodoDetails) {
        self.title = fragment.text
        self.complete = fragment.complete
    }
}
