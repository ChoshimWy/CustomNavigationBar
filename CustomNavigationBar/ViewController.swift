//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by 享印科技 on 2019/8/30.
//  Copyright © 2019 Choshim丶Wy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var tableView: UITableView = {
        let t = UITableView(frame: view.bounds)
        t.rowHeight = 80
        t.delegate = self
        t.dataSource = self
        t.backgroundColor = UIColor.orange
        t.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        title = "自定义导航"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(clickButton(_:)))
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x:0, y: 1)
//        gradientLayer.frame = view.bounds
//        view.layer.insertSublayer(gradientLayer, at: 0)
        
        view.addSubview(tableView)
       
    }

     @objc func clickButton(_ sender: UIButton) {
        
        navigationController?.pushViewController(TestController(), animated: true)
    }
    
    
    override var customNavigationBarBackgroundColor: UIColor? {
       return UIColor.blue
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
}
