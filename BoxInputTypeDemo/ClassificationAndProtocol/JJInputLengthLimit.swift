//
//  JJInputLengthLimit.swift
//  BoxInputTypeDemo
//
//  Created by 刘隆昌 on 2017/10/28.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import Foundation
import UIKit

var maxLength = JJMaxLength()


extension UITextField{
    
    
    func textFieldNumberLimit(textField:UITextField,number:Int,delegate:Any){
        
        textField.addTarget(textField, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        
        
    }
    
    @objc func textFieldDidChange(textField:UITextField){
        
        
        
        
        
    }
    
    
    
    
    
    
}

