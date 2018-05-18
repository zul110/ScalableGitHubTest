//
//  CommitAuthorModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation

class CommitAuthorModel: Decodable {
    var name: String?
    var email: String?
    var date: String?
}
