//
//  ViewController.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var reposVM: ReposViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reposVM = ReposViewModel()
        self.reposVM.delegate = self
        self.reposVM.getData()
    }
}

