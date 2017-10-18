//
//  AppError.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/19.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//

import Foundation

enum AppError: Error {
    case noError
    case network
    case notAuthorized
    case generic
    
    var isError: Bool {
        return self != .noError
    }
}
