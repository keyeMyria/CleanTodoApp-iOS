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
    func updateTodo(_ todo: TodoModel) -> Observable<Bool>
    func changeCompleteTodo(_ todo: TodoModel) -> Observable<Bool>
    func deleteTodo(_ todo: TodoModel) -> Observable<Bool>
    func createTodo(_ title: String, complete: Bool) -> Observable<Bool>
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
    
    func updateTodo(_ todo: TodoModel) -> Observable<Bool> {
        return self.todoRepository.updateTodo(todo)
    }
    
    func changeCompleteTodo(_ todo: TodoModel) -> Observable<Bool> {
        return self.todoRepository.updateTodo(
            TodoModel(
                id: todo.id,
                title: todo.title,
                complete: !todo.complete
            )
        )
    }
    
    func deleteTodo(_ todo: TodoModel) -> Observable<Bool> {
        return self.todoRepository.deleteTodo(todo)
    }
    
    func createTodo(_ title: String, complete: Bool) -> Observable<Bool> {
        return self.todoRepository.createTodo(title, complete: complete)
    }
}
