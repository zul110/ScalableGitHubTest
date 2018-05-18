//
//  CommitDataModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation

class CommitDataModel: Decodable {
    var sha: String?
    var commit: CommitModel?
    var url: String?
    var html_url: String?
    var comments_url: String?
    var author, committer: AuthorModel?
    var parents: [ParentModel]?
    
    var message: String?
    var documentation_url: String?
}
