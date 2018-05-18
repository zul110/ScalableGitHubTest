//
//  TableViewDelegate+DataSource_MainViewControllerExtension.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import UIKit

// UITableView Delegate and DataSource extension of ViewController
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // Returns cells equal to the number of repositories of a given user
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reposVM.repos.count
    }
    
    // Creates and returns a RepoTableViewCell, and passes the repo for the current index path to it,
    // IF the repo hasn't already been invalidated by Realm
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell") as? RepoTableViewCell else {
            return UITableViewCell()
        }
        
        let index = indexPath.row
        let repo = self.reposVM.repos[index]
        
        if !repo.isInvalidated {
            cell.repo = repo
        }
        
        return cell
    }
}
