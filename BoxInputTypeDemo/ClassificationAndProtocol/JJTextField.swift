//
//  JJTextField.swift
//  BoxInputTypeDemo
//
//  Created by 刘隆昌 on 2017/10/28.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit


enum textFieldType {
    case phone,IDCard,bankCard,password
}


fileprivate let defaultPlaceholderID = "请输入身份证号"
fileprivate let defaultPlaceholderPhone = "请输入手机号"
fileprivate let defaultPlaceholderBankCard = "请输入银行卡号"
fileprivate let defaultPlaceholderPassword = "请输入密码"


class JJTextField: UITextField,JJOuterBorderSettings {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.overrideTextColor()
        self.delegate = self as! UITextFieldDelegate
        self.borderIsHiddens(borderIsHidden: false, textField: self)
    }
    
    /*MARK: 外边框是否显示
     遵守JJOuterBorderSettings 来实现边框是否显示或隐藏 如果不遵守协议 默认不显示
     */
    var borderIsHidden : Bool? {
        didSet{
            self.borderIsHiddens(borderIsHidden: borderIsHidden!, textField: self)
        }
    }
    
    //MARK: - textField输入框类型
    /*
     创建textField 同时给出textField的类型
     phone: 手机输入框
     IDCard :身份证类型
     bankCard :银行卡类型
     password: 密码类型
     */
    var type: textFieldType? {
        didSet{
            types(textFieldType: type!)
        }
    }
    
    
    func types(textFieldType:textFieldType){
        
        switch textFieldType {
        case .IDCard:
            
            self.textFieldNumberLimit(textField: self, number: jj_IDCardLength, delegate: self)
            self.keyboardType = .asciiCapable
            self.placeholder = defaultPlaceholderID
            
        case .phone:
            
            self.textFieldNumberLimit(textField: self, number: jj_phoneLength, delegate: self)
            self.keyboardType = .numberPad;
            self.placeholder = defaultPlaceholderPhone
            
        case .bankCard:
            
            self.textFieldNumberLimit(textField: self, number: jj_bankCardLength, delegate: self)
            self.keyboardType = .numberPad
            self.placeholder = defaultPlaceholderBankCard
            
        case .password:
            
            self.textFieldNumberLimit(textField: self, number: jj_passwordLength, delegate: self)
            self.keyboardType = .asciiCapable
            self.placeholder = defaultPlaceholderPassword
            self.isSecureTextEntry = true
            self.clearButtonMode = .never
            //如果不需要把眼睛的控件展示 注释掉这块代码
            self.createEyeBtn()
        }
    }
    
    //MARK: - 重写提示语
    var placeholderText : String? {
        didSet{
            self.placeholder = placeholderText
        }
    }
    
    
    //MARK: - 重写text方法 对外获取UITextField的text调用这个方法即可
    func textOverride()->String? {
        let strings = self.text?.replacingOccurrences(of: " ", with: "");
        return strings;
    }
    
    //MARK: - 关闭黏贴复制
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        UIMenuController.shared.isMenuVisible = false
        return false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



extension JJTextField{
    
    
    func createEyeBtn(){
        let eyeButton = UIButton.init(type: .system)
        eyeButton.frame = CGRect(x: -50, y: 0, width: 16, height: 16);
        let eyeImageFalse = UIImage(named: "icon_hide");
        eyeButton.setImage(eyeImageFalse, for: .normal)
        eyeButton.backgroundColor = UIColor.clear
        rightView = eyeButton
        rightViewMode = .always
        eyeButton.addTarget(self, action: #selector(JJTextField.action(btn:)), for: .touchUpInside)
        eyeButton.tag = 100+1;
    }
    
    
    @objc func action(btn:UIButton) {
        let eyeImageFalse = UIImage.init(named: "icon_hide")
        let eyeImageTrue = UIImage.init(named: "icon_show")
        if btn.tag == 100 + 0 {
                btn.setImage(eyeImageFalse, for: .normal)
                self.isSecureTextEntry = true
            btn.tag = 1+100;
        }else{
                btn.setImage(eyeImageTrue, for: .normal)
            self.isSecureTextEntry = false
            btn.tag = 0+100;
        }
    }
    
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x = self.frame.size.width-32//要往右偏多少根据自己需求 改变这个数字就好
        return rect
    }
    
}




extension JJTextField : UITextFieldDelegate{
    
    
    func onlyInputTheNumber(_ string:NSString) -> Bool {
        let numString = jj_numAndChar;
        let predicate = NSPredicate(format: "SELF MATCHES %@", numString);
        let number = predicate.evaluate(with: string)
        return number
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textFieldText = textField.text! as NSString;
        let oo = self.onlyInputTheNumber(string as NSString);
        
        if string == "" {
            if (textFieldText.length-2)%5 == 0 {
                textField.text = textFieldText.substring(to: textFieldText.length-1)
            };return true;
        }else{
            switch type{
            case .IDCard? :
                IDCardInputFormat(textField: textField, textFieldText: textFieldText)
            case .phone?:
                phoneInputFormat(textField: textField, textFieldText: textFieldText)
            case .bankCard?:
                bankCardInputFormat(textField: textField, textFieldText: textFieldText)
            case .password?:
                print("密码")
            case .none:
                print("")
            }
        }
        return oo;
    }
    
    
    /*手机号输入+空格*/
    func phoneInputFormat(textField:UITextField,textFieldText:NSString){
        if textFieldText.length == 3 || textFieldText.length == 8 {
            textField.text = textField.text! + " "
        }
    }
    /*身份证号输入+空格*/
    func IDCardInputFormat(textField:UITextField,textFieldText:NSString){
        if textFieldText.length == 3 || textFieldText.length == 7 || textFieldText.length == 12 || textFieldText.length == 17 {
            textField.text = textField.text! + " "
        }
    }
    
    /*银行卡号输入+空格*/
    func bankCardInputFormat(textField:UITextField,textFieldText:NSString){
        if textFieldText.length == 4 || textFieldText.length == 9 || textFieldText.length == 14{
            textField.text = textField.text! + " "
        }
    }
    
    
    
    
    
}


