//
//  TestController.swift
//  CustomNavigationBar
//
//  Created by 享印科技 on 2019/8/30.
//  Copyright © 2019 Choshim丶Wy. All rights reserved.
//

import UIKit

class TestController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        title = "改变导航"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(clickAction))
    }
    
    @objc func clickAction() {
        navigationController?.pushViewController(TranslucentController(), animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    override var customNavigationBarBackgroundColor: UIColor? {
        return UIColor.orange
    }
    
    override var customBarTintColor: UIColor? {
        return .white
    }
    
    override var customTitleTextAttributes: [NSAttributedString.Key : Any]? {
        return [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
