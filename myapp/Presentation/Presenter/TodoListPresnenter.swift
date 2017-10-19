//
//  TodoListPresnenter.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation
import RxSwift

enum TodoListStatus {
    case none
    // case notAuthorized
    case loading
    case normal
    case error
}

// MARK: - Interface
protocol TodoListPresenter {
    func loadTodoes(_ page: Int)
    func onClickAdd()
    func onClickEdit(_ todo: TodoModel)
    func onClickDone(_ todo: TodoModel)
    func onClickDelete(_ todo: TodoModel)
    func updateTodo(_ todo: TodoModel, title: String?)
    func createTodo(_ title: String?)
}

class TodoListPresenterImpl: TodoListPresenter {
    weak var viewInput: TodoListViewInput?
    let wireframe: TodoListWireframe
    let useCase: TodoListUseCase
    
    fileprivate let disposeBag = DisposeBag()
    
    public required init(useCase: TodoListUseCase, viewInput: TodoListViewInput, wireframe: TodoListWireframe) {
        self.useCase = useCase
        self.viewInput = viewInput
        self.wireframe = wireframe
    }
    
    func loadTodoes(_ page: Int) {
        self.viewInput?.changedStatus(TodoListStatus.loading)
        
        useCase.loadTodoes(page)
            .subscribe(
                onNext: { [weak self] todoes in
                    self?.viewInput?.setTodoesModel(todoes)
                    self?.viewInput?.changedStatus(TodoListStatus.normal)
                }, onError: { [weak self] error in
                    self?.viewInput?.changedStatus(TodoListStatus.error)
                }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    func onClickAdd() {
        // self.wireframe.showNewTodo()
        self.viewInput?.showAddAlert()
    }
    
    func onClickEdit(_ todo: TodoModel) {
        self.viewInput?.showEditAlert(todo)
    }
    
    func onClickDone(_ todo: TodoModel) {
        useCase.changeCompleteTodo(todo)
            .subscribe(onNext: { [weak self] isSuccess in
                self?.loadTodoes(0)
            }, onError: { [weak self] error in
                self?.viewInput?.changedStatus(TodoListStatus.error)
            }, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
    
    func onClickDelete(_ todo: TodoModel) {
        useCase.deleteTodo(todo)
            .subscribe(onNext: { [weak self] isSuccess in
                self?.loadTodoes(0)
                }, onError: { [weak self] error in
                    self?.viewInput?.changedStatus(TodoListStatus.error)
            }, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
    
    func createTodo(_ title: String?) {
        guard let title = title else {
            self.viewInput?.showToster(message: "タイトルが存在しないため追加できません")
            return
        }
        if title.count == 0 {
            self.viewInput?.showToster(message: "タイトルが空のため追加できません")
            return
        }
        
        self.useCase.createTodo(title, complete: false)
            .subscribe(onNext: { [weak self] isSuccess in
                self?.loadTodoes(0)
                self?.viewInput?.showToster(message: "Todoを追加しました")
                }, onError: { [weak self] error in
                    self?.viewInput?.changedStatus(TodoListStatus.error)
                }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    func updateTodo(_ todo: TodoModel, title: String?) {
        guard let title = title else {
            self.viewInput?.showToster(message: "タイトルが存在しないため変更できません")
            return
        }
        if title.count == 0 {
            self.viewInput?.showToster(message: "タイトルが空のため変更できません")
            return
        }
        
        useCase.updateTodo(TodoModel(
            id: todo.id,
            title: title,
            complete: todo.complete
        ))
            .subscribe(onNext: { [weak self] isSuccess in
                self?.loadTodoes(0)
            }, onError: { [weak self] error in
                    self?.viewInput?.changedStatus(TodoListStatus.error)
            }, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
}
