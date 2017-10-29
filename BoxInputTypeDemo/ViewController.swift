//
//  ViewController.swift
//  BoxInputTypeDemo
//
//  Created by 刘隆昌 on 2017/10/27.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    lazy var tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain);
    lazy var dataSource = ["手机号","身份证","银行卡","密码(6-18位数字和字母组合)"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "输入框";
        
        tableView.register(UITableViewCell().classForCoder, forCellReuseIdentifier: "cellID")
        
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        tableViewCell.textLabel?.text = dataSource[indexPath.row];
        tableViewCell.selectionStyle = .none;
        return tableViewCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = JJTextFieldViewController()
        vc.typeID = "\(indexPath.row)" as NSString
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}







