//
//  ViewController.swift
//  Counter
//
//  Created by Леонид Лебедев on 12.11.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter = 0
    
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "0"
        historyTextView.text = "История изменений:\n"
        
    }
    
    @IBAction func plusButton(_ sender: Any) {
        counter += 1
        updateUI(change: "+1")
    }
    
    @IBAction func resetButton(_ sender: Any) {
        counter = 0
        updateUI(change: "значение сброшено")
    }
    
    @IBAction func minusButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateUI(change: "-1")
        } else {
            appendToHistory(text: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    private func updateUI(change: String) {
        counterLabel.text = "\(counter)"
        appendToHistory(text: "значение изменено на \(change)")
    }
    private func appendToHistory(text: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let timestamp = dateFormatter.string(from: Date())
        historyTextView.text += "[\(timestamp)]: \(text)\n"
        
        let bottom = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
}
