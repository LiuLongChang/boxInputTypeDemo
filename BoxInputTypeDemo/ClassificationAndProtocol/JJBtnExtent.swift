//
//  JJBtnExtent.swift
//  BoxInputTypeDemo
//
//  Created by 刘隆昌 on 2017/10/28.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit

extension UIButton{
    
    func loadBtn()->UIButton{
        let btn = UIButton.init(type: .custom);
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect.init(x: 0, y: 0, width: 110, height: 30);
        btn.setTitle("获取text", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        return btn
    }
    
}
