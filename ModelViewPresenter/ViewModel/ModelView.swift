//
//  Presenter.swift
//  ModelViewPresenter
//
//  Created by Sanjay Patil on 1/20/20.
//  Copyright © 2020 Sanjay Patil. All rights reserved.
//

import Foundation
class ModelView {
    // In ViewModel, we are just chaging the Data Model to be observable to support the automatic updates.
    private var model:DataModel<ModelObserver<Date>> = DataModel()
    
    func addElement(_ element:Date)  {
        let dateObservable = ModelObserver(Date())
        self.model.addElement(dateObservable)
        dateObservable.bind = { _ in
            NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "updateUI")))
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
            dateObservable.value = Date()
        }
    }
    
    func removeElement(at index:Int) {
        self.model.removeElement(at:index)
    }
    
    var count:Int {
        self.model.count
    }
    subscript(index:Int) -> Date? {
        return self.model[index]?.value
    }
}
