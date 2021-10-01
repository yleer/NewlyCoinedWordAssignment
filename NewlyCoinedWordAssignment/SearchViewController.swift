//
//  ViewController.swift
//  NewlyCoinedWordAssignment
//
//  Created by Yundong Lee on 2021/10/01.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let wordDict = [
        "jmt" : "존맛탱",
        "존멋" : "존나멋있어",
        "갑뿐싸" : "갑자기 분위기 싸하다",
        "존예" : "존나 예뻐"
        
    ]
    
    var currentWordArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func tapOutsideScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func endEditing(_ sender: UITextField) {
        searchPart()
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        searchPart()
    }
    
    func searchPart(){
        if let searchedWord = searchTextField.text, let meaning = wordDict[searchedWord]{
            resultLabel.text = meaning
            if currentWordArray.count < 4{
                currentWordArray.append(contentsOf: searchedWord)
            }else{
                currentWordArray.remove(at: 0)
                currentWordArray.append(contentsOf: searchedWord)
            }
        }else{
            resultLabel.text = "없는 단어입니다."
        }
        
        
        
        view.endEditing(true)
    }
}

