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
    func updateTodo(_ todo: TodoEntity) -> Observable<Bool>
    func deleteTodo(_ todo: TodoEntity) -> Observable<Bool>
}

struct TodoDataStoreImpl: TodoDataStore {
    var todoesWatcher: GraphQLQueryWatcher<AllTodoesQuery>?
    
    func getAllTodoes(_ page: Int) -> Observable<[TodoDetails]> {
        return Observable.create({ (observer) -> Disposable in
            apollo.fetch(query: AllTodoesQuery(), cachePolicy: .fetchIgnoringCacheData) { result, error in
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
    }
    
    func updateTodo(_ todo: TodoEntity) -> Observable<Bool> {
        return Observable.create({ (observer) -> Disposable in
            apollo.perform(mutation: UpdateTodoMutation(id: todo.id, text: todo.title, complete: todo.complete)) { result, error in
                if (error != nil) {
                    observer.onError(AppError.generic)
                    return
                }
                observer.onNext(true)
                observer.onCompleted()
            }
            
            return Disposables.create()
        })
    }
    
    func deleteTodo(_ todo: TodoEntity) -> Observable<Bool> {
        return Observable.create({ (observer) -> Disposable in
            apollo.perform(mutation: DeleteTodoMutation(id: todo.id)) { result, error in
                if (error != nil) {
                    observer.onError(AppError.generic)
                    return
                }
                observer.onNext(true)
                observer.onCompleted()
            }
            return Disposables.create()
        })
    }
}
