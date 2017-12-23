//
//  TextViewModel.swift
//  MVVMBox
//
//  Created by anoop mohanan on 22/12/17.
//  Copyright © 2017 anoop. All rights reserved.
//

import Foundation

struct TextViewModel {
    var name:Box<String?> = Box(nil)
    var reversedName:Box<String?> = Box(nil)
    
    mutating func reverseName(){

        if let val = name.value{            
            let reversed = String(val.reversed())
            self.reversedName.value = reversed
        }
    }
}
