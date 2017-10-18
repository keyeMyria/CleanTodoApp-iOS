//
//  TodoListViewController.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol TodoListViewInput: class {
    func setTodoesModel(_: TodoesModel)
    func changedStatus(_: TodoListStatus)
}

class TodoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: TodoListPresenter?
    var todoes: [TodoModel] = []
    var status: TodoListStatus = .loading
    fileprivate let disposeBag = DisposeBag()

    public func inject(presenter: TodoListPresenter) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        self.presenter?.loadTodoes(0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
}

extension TodoListViewController {
    func setupUI() {
        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableViewAutomaticDimension
        
        var button = UIBarButtonItem()
        button.title = "Add"
        button.rx.tap.subscribe(onNext: { _ in
            self.presenter?.onClickAdd()
        }).disposed(by: disposeBag)
        self.navigationItem.rightBarButtonItem = button
    }
}


// MARK: TodoListViewInput
extension TodoListViewController: TodoListViewInput {
    func setTodoesModel(_ todoesModel: TodoesModel) {
        self.todoes = todoesModel.items
        self.tableView.reloadData()
    }
    
    func changedStatus(_ status: TodoListStatus) {
        self.status = status
        self.tableView.reloadData()
    }
}

// MARK: Table view data source
extension TodoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell        
        let todo: TodoModel = todoes[indexPath.row]
        cell.todo = todo
        cell.isComplete = todo.complete
        cell.delegate = self
        
        return cell
    }
}

// MARK: UITableView Delegate
extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch status {
        case .normal:
            // let todo: TodoModel = todoes[indexPath.row]
            return
        default:
            return
        }
    }
}

// MARK: TodoCellOutputs
extension TodoListViewController: TodoCellOutputs {
    func onClickDelete(todo: TodoModel) {
        self.presenter?.onClickDelete(todo)
    }
    
    func onClickDone(todo: TodoModel) {
        self.presenter?.onClickDone(todo)
    }
}
