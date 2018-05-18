//
//  RefreshControl_MainViewControllerExtension.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import UIKit

// RefreshControl extension for the ViewController
extension ViewController {
    // Adds the refresh control to the tableview, and adds the refresh handler when the value changes
    func addRefreshControlToTableView() {
        self.refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: .valueChanged)
        self.refreshControl.tintColor = .black
        
        self.reposTableView.addSubview(self.refreshControl)
    }
    
    // Handler for the refresh control
    // Updates the persistet storage from the ViewModel
    @objc func handleRefresh(_ sender: UIRefreshControl) {
        self.reposVM.updatePersistentRepos()
        
        self.refreshControl.endRefreshing()
    }
}
