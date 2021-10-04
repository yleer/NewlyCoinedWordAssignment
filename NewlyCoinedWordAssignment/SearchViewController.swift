//
//  ViewController.swift
//  NewlyCoinedWordAssignment
//
//  Created by Yundong Lee on 2021/10/01.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet var worButtons: [UIButton]!{
        didSet{
            for index in worButtons.indices{
                if worButtons[index].isHidden{
                    
                }else{
                    worButtons[index].layer.borderColor = UIColor.black.cgColor
                    worButtons[index].layer.borderWidth = 1
                    
                }
            }
        }
    }
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let wordDict = [
        "jmt" : "존맛탱",
        "존멋" : "존나멋있어",
        "갑뿐싸" : "갑자기 분위기 싸하다",
        "존예" : "존나 예뻐"
    ]
    
    var currentWordArray : [String] = []{
        didSet{
            for index in currentWordArray.indices{
                worButtons[index].isHidden = false
                worButtons[index].setTitle(currentWordArray[index], for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.layer.borderWidth = 3
        
        for index in worButtons.indices{
            worButtons[index].isHidden = true
        }
        
    }

    @IBAction func wordButtonClicked(_ sender: UIButton) {
        searchTextField.text = sender.currentTitle
        
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
                currentWordArray.append(searchedWord)
            }else{
                currentWordArray.remove(at: 0)
                currentWordArray.append(searchedWord)
            }
        }else{
            resultLabel.text = "없는 단어입니다."
        }
        
        view.endEditing(true)
    }
}

