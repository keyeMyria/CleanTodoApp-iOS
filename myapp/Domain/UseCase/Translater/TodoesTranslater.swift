//
//  TodoTranslater.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation

struct TodoesTranslater: Translator {
    typealias Input = TodoesEntity
    typealias Output = TodoesModel
    
    func translate(_ entity: TodoesEntity) throws -> TodoesModel {
        var todoesModel: TodoesModel = TodoesModel()
        entity.items.forEach { rowTodo -> () in
            let todoModel = TodoModel(entity: rowTodo)
            todoesModel.items.append(todoModel)
        }
        return todoesModel
    }
}
