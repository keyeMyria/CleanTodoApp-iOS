//
//  TodoListWireframe.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation

protocol TodoListWireframe: class {
    weak var viewController: TodoListViewController? { get set }
    
    func showNewTodo()
    func showEditTodo()
}

class TodoListWireframeImpl: TodoListWireframe {
    weak var viewController: TodoListViewController?
    
    func showNewTodo() {/* 新規投稿画面への遷移実装 */}
    func showEditTodo() {/* 編集画面への遷移実装 */}
}
