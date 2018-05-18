//
//  LicenseModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class LicenseModel: Object, Decodable {
    @objc dynamic var key: String? = nil
    @objc dynamic var name: String? = nil
    @objc dynamic var spdxID: String? = nil
    @objc dynamic var url: String? = nil
    
    enum CodingKeys : String, CodingKey {
        case key
        case name
        case spdxID
        case url
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
