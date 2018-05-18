//
//  RepoTableViewCell.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    @IBOutlet var cell: UITableViewCell!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var lastCommitByLabel: UILabel!
    @IBOutlet weak var lastCommitDateTimeLabel: UILabel!
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var watcherCountLabel: UILabel!
    @IBOutlet weak var issueCountLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var commitsVM: CommitsViewModel! {
        didSet {
            self.commitsVM.delegate = self
            
            self.activityIndicator.isHidden = false
        }
    }
    
    var repo: RepoModel! {
        didSet {
            self.repoName = self.repo.name
            self._description = self.repo._description
            self.forkCount = self.repo.forks_count
            self.watcherCount = self.repo.watchers_count
            self.issueCount = self.repo.open_issues_count
        }
    }
    
    var repoName: String! {
        didSet {
            DispatchQueue.main.async {
                self.repoNameLabel.text = self.repoName
            }
            
            if let commits = self.repo.commits {
                let lastCommit = commits.count > 0 ? commits[0] : nil
                self.showLastCommit(lastCommit)
            } else {
                self.commitsVM = CommitsViewModel(self.repoName)
            }
        }
    }
    
    var _description: String! {
        didSet {
            DispatchQueue.main.async {
                self.descriptionLabel.text = self._description
            }
        }
    }
    
    var lastCommitMessage: String! {
        didSet {
            DispatchQueue.main.async {
                self.messageLabel.text = self.lastCommitMessage
            }
        }
    }
    
    var lastCommitBy: String! {
        didSet {
            DispatchQueue.main.async {
                self.lastCommitByLabel.text = self.lastCommitBy
            }
        }
    }
    
    var lastCommitDateTime: String! {
        didSet {
            DispatchQueue.main.async {
                self.lastCommitDateTimeLabel.text = self.lastCommitDateTime
            }
        }
    }
    
    var forkCount: Int! {
        didSet {
            DispatchQueue.main.async {
                self.forkCountLabel.text = String(self.forkCount)
            }
        }
    }
    
    var watcherCount: Int! {
        didSet {
            DispatchQueue.main.async {
                self.watcherCountLabel.text = String(self.watcherCount)
            }
        }
    }
    
    var issueCount: Int! {
        didSet {
            DispatchQueue.main.async {
                self.issueCountLabel.text = String(self.issueCount)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initView()
    }
    
    private func initView() {
        Bundle.main.loadNibNamed("RepoTableViewCell", owner: self, options: nil)
        
        guard let cell = self.cell else { return }
        cell.frame = self.bounds
        cell.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        self.addSubview(cell)
    }
}
