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
    func onClickDone(_ todo: TodoModel)
    func onClickDelete(_ todo: TodoModel)
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
    
    func onClickDone(todo: TodoModel) {
    }
    
    func onClickDelete(todo: TodoModel) {
    }
}
