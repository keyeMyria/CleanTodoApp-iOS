//
//  TodoCell.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/19.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import UIKit

protocol TodoCellOutputs: class {
    func onClickDelete(todo: TodoModel)
    func onClickDone(todo: TodoModel)
}
class TodoCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    weak var delegate: TodoCellOutputs?
    
    // MARK: - Properties
    var isComplete: Bool = false {
        didSet {
            doneButton.setTitle(isComplete ? "未完了に戻す" : "完了にする", for: .normal)
            titleLabel.textColor = isComplete ? UIColor.blue : UIColor.red
        }
    }
    
    var todo: TodoModel! {
        didSet {
            titleLabel.text = "\(todo.title)"
        }
    }
    
    @IBAction func onClickDelete(_ sender: Any) {
        delegate?.onClickDelete(todo: todo)
    }
    
    @IBAction func onClickDone(_ sender: Any) {
        delegate?.onClickDone(todo: todo)
    }
    
    
}
