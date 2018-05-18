//
//  VerificationModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation

class VerificationModel: Decodable {
    var verified: Bool?
    var reason: String?
    var signature: String?
    var payload: String?
}
