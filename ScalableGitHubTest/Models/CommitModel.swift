//
//  CommitModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation

class CommitModel: Decodable {
    var author: CommitAuthorModel?
    var committer: CommitAuthorModel?
    var message: String?
    var tree: TreeModel?
    var url: String?
    var comment_count: Int?
    var verification: VerificationModel?
}
