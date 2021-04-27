//
//  ViewController.swift
//  Task12App
//
//  Created by 山崎喜代志 on 2021/04/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var amountTextField: UITextField!
    @IBOutlet weak private var taxTextField: UITextField!
    @IBOutlet weak private var totalLabel: UILabel!

    private let saveRepository = SaveRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.keyboardType = .numberPad
        taxTextField.keyboardType = .numberPad

        guard let tax = saveRepository.getTax() else {
            return
        }
        taxTextField.text = String(tax)
    }

    @IBAction private func tapCaluculate(_ sender: Any) {
        guard let amountExcludingTax = Int(amountTextField.text ?? ""),
              let tax = Int(taxTextField.text ?? "") else { return }

        let totalAmount = TotalAmountCalculator().calculate(amountExcludingTax: amountExcludingTax, tax: tax)

        saveRepository.saveTax(tax: tax)
        totalLabel.text = String(totalAmount)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
