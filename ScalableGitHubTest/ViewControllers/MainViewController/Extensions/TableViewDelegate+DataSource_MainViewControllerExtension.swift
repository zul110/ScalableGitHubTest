//
//  TableViewDelegate+DataSource_MainViewControllerExtension.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reposVM.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell") else {
            return UITableViewCell()
        }
        
        let index = indexPath.row
        let repo = self.reposVM.repos[index]
        
        if !repo.isInvalidated {
            cell.textLabel?.text = repo.name!
        }
        
        return cell
    }
}
