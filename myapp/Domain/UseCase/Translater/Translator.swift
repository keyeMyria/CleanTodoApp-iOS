//
//  Translator.swift
//  myapp
//
//  Created by yuta nishimori on 2017/10/18.
//  Copyright © 2017年 yuta nishimori. All rights reserved.
//
// https://github.com/koutalou/iOS-CleanArchitecture/blob/master/iOSCleanArchitectureTwitterSample/Domain/UseCase/Translater/Translator.swift

import Foundation
import RxSwift

public protocol Translator {
    associatedtype Input
    associatedtype Output
    func translate(_: Input) throws -> Output
}

public extension ObservableType {
    public func map<T: Translator>(translator: T) -> Observable<T.Output> where Self.E == T.Input {
        return map { try translator.translate($0) }
    }
}

extension Collection {
    public func map<T: Translator>(translator: T) throws -> [T.Output] where Self.Iterator.Element == T.Input {
        return try map { try translator.translate($0) }
    }
}
