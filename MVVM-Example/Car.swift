//
//  Car.swift
//  MVVM-Example
//
//  Created by 윤상호 on 2017. 4. 17..
//  Copyright © 2017년 SanghoYoon. All rights reserved.
//

import Foundation

class Car {
    var model: String
    var make: String
    var kilowatts: Int
    var photoURL: String
    
    init(model: String, make: String, kilowatts: Int, photoURL: String) {
        self.model = model
        self.make = make
        self.kilowatts = kilowatts
        self.photoURL = photoURL
    }
}
