//
//  JJTextColor.swift
//  BoxInputTypeDemo
//
//  Created by 刘隆昌 on 2017/10/28.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit

extension UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func RGB(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor{
        let color = UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
        return color
    }
    
    func overrideTextColor() -> Void {
        self.textColor = RGB(r: 210, g: 105, b: 30);
    }

}
