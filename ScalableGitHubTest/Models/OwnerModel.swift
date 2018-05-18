//
//  OwnerModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class OwnerModel: Object, Decodable {
    @objc dynamic var login: String? = nil
    @objc dynamic var id: Int = 0
    @objc dynamic var avatar_url: String? = nil
    @objc dynamic var gravatar_id: String? = nil
    @objc dynamic var url: String? = nil
    @objc dynamic var html_url: String? = nil
    @objc dynamic var followers_url: String? = nil
    @objc dynamic var following_url: String? = nil
    @objc dynamic var gists_url: String? = nil
    @objc dynamic var starred_url: String? = nil
    @objc dynamic var subscriptions_url: String? = nil
    @objc dynamic var organizations_url: String? = nil
    @objc dynamic var repos_url: String? = nil
    @objc dynamic var events_url: String? = nil
    @objc dynamic var received_events_url: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var site_admin: Bool = false
    
    enum CodingKeys : String, CodingKey {
        case login
        case id
        case avatar_url
        case gravatar_id
        case url
        case html_url
        case followers_url
        case following_url
        case gists_url
        case starred_url
        case subscriptions_url
        case organizations_url
        case repos_url
        case events_url
        case received_events_url
        case type
        case site_admin
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
