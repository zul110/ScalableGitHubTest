//
//  CommitsViewModelDelegate_RepoTableViewCellExtension.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation

extension RepoTableViewCell: ViewModelDelegate {
    func didGetDataSuccessfully() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
        }
        
        if self.repo.commits == nil {
            self.repo.commits = self.commitsVM.commits
        }
        
        let lastCommit = self.commitsVM.commits.count > 0 ? self.commitsVM.commits[0] : nil
        
        self.showLastCommit(lastCommit)
    }
    
    func didFailGettingData(_ error: ErrorModel) {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
        }
        
        if self.repo.commits == nil {
            self.repo.commits = self.commitsVM.commits
        }
        
        self.showLastCommit()
    }
    
    func showLastCommit(_ lastCommit: CommitDataModel? = nil) {
        self.lastCommitMessage = lastCommit?.commit?.message ?? "No commit message"
        self.lastCommitBy = lastCommit?.author?.login ?? "No author"
        self.lastCommitDateTime = lastCommit?.commit?.author?.date ?? "No date"
    }
}
