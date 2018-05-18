//
//  ReposViewModelDelegate_MainViewModelExtension.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import UIKit

extension ViewController: ViewModelDelegate {
    func didGetDataSuccessfully() {
        DispatchQueue.main.async {
            self.reposTableView.dataSource = self
            self.reposTableView.delegate = self
            
            self.reposTableView.reloadData()
            
            self.activityIndicator.isHidden = true
        }
    }
    
    func didFailGettingData(_ error: ErrorModel) {
        if self.reposVM.hasError {
            var title = ""
            var message = error.message!
            
            switch (error.type)! {
            case .network:
                title = "Network error"
                
                if error.statusCode == 403 {
                    message = "403: Forbidden. Unauthenticated requests from the same IP to the GitHub APIs are restricted to 60 calls each hour. Please try again in an hour."
                }
                
                break
            case .json:
                title = "Parse error"
                break
            case .data:
                title = "Data error"
                break
            case .unknown:
                title = "Unknown error"
                break
            }
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            alert.addAction(okayAction)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
