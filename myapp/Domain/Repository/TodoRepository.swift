//
//  TodoRepository.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation
import RxSwift

protocol TodoRepository {
    func getTodoes(_ page: Int) -> Observable<[TodoDetails]>
    func updateTodo(_ todo: TodoModel) -> Observable<Bool>
    func deleteTodo(_ todo: TodoModel) -> Observable<Bool>
}

struct TodoRepositoryImpl: TodoRepository {
    private let dataStore: TodoDataStore
    
    public init(dataStore: TodoDataStore) {
        self.dataStore = dataStore
    }
    
    func getTodoes(_ page: Int) -> Observable<[TodoDetails]> {
        return dataStore.getAllTodoes(page)
    }
    
    func updateTodo(_ todo: TodoModel) -> Observable<Bool> {
        return dataStore.updateTodo(TodoEntity(model: todo))
    }
    
    func deleteTodo(_ todo: TodoModel) -> Observable<Bool> {
        return dataStore.deleteTodo(TodoEntity(model: todo))
    }
}

