//
//  TodoListViewController.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import UIKit

protocol TodoListViewInput: class {
    func setTodoesModel(_: TodoesModel)
    func changedStatus(_: TodoListStatus)
}

class TodoListViewController: UIViewController {

    var presenter: TodoListPresenter?
    
    public func inject(presenter: TodoListPresenter) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter?.loadTodoes(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension TodoListViewController: TodoListViewInput {
    func setTodoesModel(_ todoesModel: TodoesModel) {
        print(todoesModel)
    }
    
    func changedStatus(_ status: TodoListStatus) {
        print(status)
    }
}
