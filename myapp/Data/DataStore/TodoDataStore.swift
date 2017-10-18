//
//  TodoDataStore.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

protocol TodoDataStore {
    func getAllTodoes(_ page: Int) -> Observable<TodoesEntity>
//    func getCompletedTodoes(_ page: Int) -> Observable<TodoesEntity>
}

struct TodoDataStoreImpl: TodoDataStore {
    func getAllTodoes(_ page: Int) -> Observable<TodoesEntity> {
        let JSON: [String: Any] = [
            "items" : []
        ]
        let mapper = Mapper<TodoesEntity>()
        let value: TodoesEntity! = mapper.map(JSON: JSON)
        return Observable.just(value)
    }
    
//    func getCompletedTodoes(_ page: Int) -> Observable<TodoesEntity> {}
}
