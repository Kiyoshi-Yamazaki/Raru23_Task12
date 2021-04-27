//
//  SaveModel.swift
//  Task12App
//
//  Created by 山崎喜代志 on 2021/04/05.
//

import Foundation

class SaveRepository {
    private let savedTax: String = "税率保存"

    func saveTax(tax: Int) {
        let userDefault = UserDefaults.standard
        userDefault.set(tax, forKey: savedTax)
    }

    func getTax() -> Int? {
        let userDefault = UserDefaults.standard
        return userDefault.integer(forKey: savedTax)
    }
}

struct TotalAmountCalculator {
    func calculate(amountExcludingTax: Int, tax: Int) -> Int {
        Int(Double(amountExcludingTax) * Double(100 + tax) / 100)
    }
}
