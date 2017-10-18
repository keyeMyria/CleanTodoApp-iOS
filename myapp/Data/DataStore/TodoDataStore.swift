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
import Apollo

protocol TodoDataStore {
    func getAllTodoes(_ page: Int) -> Observable<[TodoDetails]>
//    func getCompletedTodoes(_ page: Int) -> Observable<TodoesEntity>
}

struct TodoDataStoreImpl: TodoDataStore {
    func getAllTodoes(_ page: Int) -> Observable<[TodoDetails]> {
        return Observable.create({ (observer) -> Disposable in
            apollo.fetch(query: AllTodoesQuery()) { result, error in
                guard let responseData = result?.data else {
                        observer.onError(AppError.generic)
                        return
                }
                let res = responseData.allTodoes.map { $0.fragments.todoDetails }
                observer.onNext(res)
                observer.onCompleted()
            }
            
            return Disposables.create()
        })
        
//        let JSON: [String: Any] = [
//            "items" : []
//        ]
//        let mapper = Mapper<TodoesEntity>()
//        let value: TodoesEntity! = mapper.map(JSON: JSON)
//
//        apollo.fetch(query: AllTodoesQuery()) { result, error in
//            guard let todoes = result?.data?.allTodoes else { return }
//            print(todoes)
//        }
//        return Observable.just(value)
    }
    
//    func getCompletedTodoes(_ page: Int) -> Observable<TodoesEntity> {}
}
