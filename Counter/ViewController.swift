//
//  ViewController.swift
//  Counter
//
//  Created by Леонид Лебедев on 12.11.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter = 0
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "0"
        historyTextView.text = "История изменений:\n"
    }
    
    private func updateUI(change: String) {
        
        counterLabel.text = "\(counter)"
        
        if change == "сброшено" {
            appendToHistory(text: "значение сброшено")
        } else {
            appendToHistory(text: "значение изменено на \(change)")
        }
    }
    
    
    private func appendToHistory(text: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        let timestamp = dateFormatter.string(from: Date())
        historyTextView.text += "[\(timestamp)]: \(text)\n"
        
        let bottom = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    
    @IBAction private func plusButton(_ sender: Any) {
        counter += 1
        updateUI(change: "+1")
    }
    
    @IBAction private func resetButton(_ sender: Any) {
        counter = 0
        updateUI(change: "сброшено")
    }
    
    @IBAction private func minusButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateUI(change: "-1")
        } else {
            appendToHistory(text: "попытка уменьшить значение счётчика ниже 0")
        }
    }
}
