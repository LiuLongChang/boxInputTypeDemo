//
//  JJTextFieldViewController.swift
//  BoxInputTypeDemo
//
//  Created by 刘隆昌 on 2017/10/27.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit

class JJTextFieldViewController: UIViewController,JJTextFieldRegular {

    var typeID : NSString?;
    
    let phoneTextField = JJTextField.init(frame: CGRect(x: 30, y: 100, width: 300, height: 40));
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let btn = UIButton().loadBtn()
        btn.center = self.view.center
        btn.addTarget(self, action: #selector(JJTextFieldViewController.action), for: .touchUpInside)
        view.addSubview(btn);
        if typeID == "0" {
            phoneTextField.type = .phone
        }else if typeID == "1"{
            phoneTextField.type = .IDCard
        }else if typeID == "2"{
            phoneTextField.type = .bankCard
        }else if typeID == "3"{
            phoneTextField.type = .password
        }
        view.addSubview(phoneTextField)
        
        // Do any additional setup after loading the view.
        
    }
    
    
    @objc func action(){
        if typeID == "0" {
            self.phone()
        }else if typeID == "1"{
            self.isCard()
        }else if typeID == "2"{
            print("暂时无判断");
        }else if typeID == "3"{
            self.password();
        }
    }
    
    
    //手机号判断
    func phone(){
        let bool = self.jj_checkPhone(phoneTextField.textOverride()!)
        if bool {
            print(phoneTextField.textOverride() ?? "")
        }else{
            print("非手机号")
        }
    }
    
    
    //密码
    func password(){
        let bool = self.jj_checkPasswordId(phoneTextField.textOverride()!)
        if bool {
            print(phoneTextField.textOverride() ?? "")
        }else{
            print("非密码格式")
        }
    }
    
    //身份证
    func isCard(){
        let bool = self.jj_checkPasswordId(phoneTextField.textOverride()!)
        if bool {
            print(phoneTextField.textOverride() ?? "")
        }else{
            print("非身份证");
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
