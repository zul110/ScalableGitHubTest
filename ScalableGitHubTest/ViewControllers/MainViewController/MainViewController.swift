//
//  ViewController.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import UIKit

// The Main View Controller
class ViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var reposTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Additional controls
    let refreshControl = UIRefreshControl()
    
    // MARK: ViewModels
    var reposVM: ReposViewModel!
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the ViewModel
        self.reposVM = ReposViewModel()
        self.reposVM.delegate = self
        self.reposVM.getData()
        
        // Add a refresh control (pull-to-refresh) to the table
        self.addRefreshControlToTableView()
    }
}

