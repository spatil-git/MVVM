//
//  ModelObserver.swift
//  ModelViewPresenter
//
//  Created by Sanjay Patil on 1/27/20.
//  Copyright © 2020 Sanjay Patil. All rights reserved.
//

import Foundation
class ModelObserver<T> {
    var bind:(T) -> () = { _ in }
    var value:T {
        didSet{
            // Fire the bind closure.
            bind(value)
        }
    }
    init(_ value:T) {
        self.value = value
    }
}
