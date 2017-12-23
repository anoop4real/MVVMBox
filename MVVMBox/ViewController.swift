//
//  ViewController.swift
//  MVVMBox
//
//  Created by anoop mohanan on 22/12/17.
//  Copyright © 2017 anoop. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField:UITextField!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var reversedNamelabel:UILabel!
    private var viewModel = TextViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.name.bind { [unowned self] in
            self.nameLabel.text = $0
        }
        viewModel.reversedName.bind { [unowned self] in
            self.reversedNamelabel.text = $0
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let fieldText = textField.text else {
            return false
        }
        // Append the existing textfield text with the new character
        var text = fieldText + string
        // If it is the very first character, textfield text will be empty so take the 'string' and on delete also textfield text get deleted with a delay
        if range.location == 0{
           text = string
        }
        viewModel.name.value = text
        viewModel.reverseName()
        return true
    }

    

}

