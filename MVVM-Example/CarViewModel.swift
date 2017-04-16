//
//  CarViewModel.swift
//  MVVM-Example
//
//  Created by 윤상호 on 2017. 4. 17..
//  Copyright © 2017년 SanghoYoon. All rights reserved.
//

import Foundation

class CarViewModel {
    private var car: Car
    static let horsepowerPerKilowatt = 1.34102209
    
    var modelText: String {
        return car.model
    }
    
    var makeText: String {
        return car.make
    }
    
    var horsepowerText: String {
        let horsepower = Int(round(Double(car.kilowatts) * CarViewModel.horsepowerPerKilowatt))
        return "\(horsepower) HP"
    }
    
    var titleText: String {
        return "\(car.make) \(car.model)"
    }
    
    var photoURL: NSURL? {
        return NSURL(string: car.photoURL)
    }
    
    init(car: Car) {
        self.car = car
    }
}
