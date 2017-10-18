//
//  TodoListBuilder.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation
import UIKit

struct TodoListBuilder {
    func build() -> UIViewController {
        let wireframe = TodoListWireframeImpl()
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "TodoList") as! TodoListViewController
        let useCase = TodoListUseCaseImpl(
            todoRepository: TodoRepositoryImpl(
                dataStore: TodoDataStoreImpl()
            )
        )
        let presenter = TodoListPresenterImpl(useCase: useCase, viewInput: viewController, wireframe: wireframe)
        viewController.inject(presenter: presenter)
        wireframe.viewController = viewController
        
        return viewController
    }
}
