//
//  RefreshControl_MainViewControllerExtension.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import UIKit

extension ViewController {
    func addRefreshControlToTableView() {
        self.refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: .valueChanged)
        self.refreshControl.tintColor = .gray
        
        self.reposTableView.addSubview(self.refreshControl)
    }
    
    @objc func handleRefresh(_ sender: UIRefreshControl) {
        self.reposVM.updatePersistentRepos()
        
        self.refreshControl.endRefreshing()
    }
}
