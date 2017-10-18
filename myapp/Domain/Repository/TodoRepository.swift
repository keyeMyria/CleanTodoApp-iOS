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
    func getTodoes(_ page: Int) -> Observable<TodoesEntity>
}

struct TodoRepositoryImpl: TodoRepository {
    private let dataStore: TodoDataStore
    
    public init(dataStore: TodoDataStore) {
        self.dataStore = dataStore
    }
    
    func getTodoes(_ page: Int) -> Observable<TodoesEntity> {
        return dataStore.getAllTodoes(page)
    }
}

