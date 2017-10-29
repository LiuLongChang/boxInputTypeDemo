//
//  JJTextFieldRegular.swift
//  BoxInputTypeDemo
//
//  Created by 刘隆昌 on 2017/10/28.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit


protocol JJTextFieldRegular {
    
}

extension JJTextFieldRegular{

    //身份证类型的正则判断
    func jj_checkUserIdCard(_ isCard: String)->Bool{
        let regualr = "(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)"
        let format = NSPredicate.init(format: "SELF MATCHES %@", regualr)
        let result:Bool = format.evaluate(with: isCard)
        return result;
    }
    
    
    //6-18位密码判断
    func jj_checkPasswordId(_ passWord:String)->Bool{
        let regular = "^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}"
        let format = NSPredicate.init(format: "SELF MATCHES %@", regular);
        let result:Bool = format.evaluate(with: passWord)
        return result;
    }
    
    
    //手机号码判断
    func jj_checkPhone(_ phone:String)->Bool{
        
        let MOBIL = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$"
        let CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let CT = "^1((33|53|8[019])[0-9]|349)\\d{7}$"
        
        let regextestmobile = NSPredicate.init(format: "SELF MATCHES %@", MOBIL)
        let regextestcm = NSPredicate.init(format: "SELF MATCHES %@", CM)
        let regextestcu = NSPredicate.init(format: "SELF MATCHES %@", CU)
        let regexestct = NSPredicate.init(format: "SELF MATCHES %@", CT)
        
        if regextestmobile.evaluate(with: phone) || regextestcm.evaluate(with: phone) || regextestcu.evaluate(with: phone) || regexestct.evaluate(with: phone) {
            return true
        }
        return false
    }
    
    
    
    
    
}

