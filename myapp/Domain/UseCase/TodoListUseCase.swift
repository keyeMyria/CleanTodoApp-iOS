//
//  TodoListUseCase.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation
import RxSwift

protocol TodoListUseCase {
    func loadTodoes(_ page: Int) -> Observable<TodoesModel>
}

struct TodoListUseCaseImpl: TodoListUseCase {    
    private let todoRepository: TodoRepository
    
    public init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
    }
    
    func loadTodoes(_ page: Int) -> Observable<TodoesModel> {
        return self.todoRepository.getTodoes(page)
            .map(translator: TodoesTranslater())
    }
}
