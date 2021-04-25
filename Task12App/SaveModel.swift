//
//  SaveModel.swift
//  Task12App
//
//  Created by 山崎喜代志 on 2021/04/05.
//

import Foundation

class SaveModel {
    private let savedTax: String = "税率保存"

    public func saveTax(tax: Int) {
        let userDefault = UserDefaults.standard
        userDefault.set(tax, forKey: savedTax)
    }

    public func getTax() -> Int? {
        let userDefault = UserDefaults.standard
        let tax = userDefault.integer(forKey: savedTax)
        return tax
    }
}

struct Calculator {
    var amountExcludingTax: Int
    var tax: Int
    var totalAmount: Int {
        Int(Double(amountExcludingTax) * Double(100 + tax) / 100)
    }
}
