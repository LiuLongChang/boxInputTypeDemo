//
//  JJOuterBorderSettings.swift
//  BoxInputTypeDemo
//
//  Created by 刘隆昌 on 2017/10/28.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit

protocol JJOuterBorderSettings {
    var borderIsHidden : Bool? {get set}
}


extension JJOuterBorderSettings{
    
    func borderIsHiddens(borderIsHidden:Bool,textField:UITextField) -> Void {
        
        guard borderIsHidden == false else {
            textField.borderStyle = .none
            return;
        }
        textField.borderStyle = .roundedRect;
    }
    
    
    
}
