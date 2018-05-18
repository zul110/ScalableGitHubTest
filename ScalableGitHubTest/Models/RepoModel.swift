//
//  RepoModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class RepoModel: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String? = nil
    @objc dynamic var full_name: String? = nil
    @objc dynamic var owner: OwnerModel?
    @objc dynamic var welcome_private: String? = nil
    @objc dynamic var html_url: String? = nil
    @objc dynamic var _description: String? = nil
    @objc dynamic var fork: Bool = false
    @objc dynamic var url: String? = nil
    @objc dynamic var forks_url: String? = nil
    @objc dynamic var keys_url: String? = nil
    @objc dynamic var collaborators_url: String? = nil
    @objc dynamic var teams_url: String? = nil
    @objc dynamic var hooks_url: String? = nil
    @objc dynamic var issue_events_url: String? = nil
    @objc dynamic var events_url: String? = nil
    @objc dynamic var assignees_url: String? = nil
    @objc dynamic var branches_url: String? = nil
    @objc dynamic var tags_url: String? = nil
    @objc dynamic var blobs_url: String? = nil
    @objc dynamic var git_tags_url: String? = nil
    @objc dynamic var git_refs_url: String? = nil
    @objc dynamic var trees_url: String? = nil
    @objc dynamic var statuses_url: String? = nil
    @objc dynamic var languages_url: String? = nil
    @objc dynamic var stargazers_url: String? = nil
    @objc dynamic var contributors_url: String? = nil
    @objc dynamic var subscribers_url: String? = nil
    @objc dynamic var subscription_url: String? = nil
    @objc dynamic var commits_url: String? = nil
    @objc dynamic var git_commits_url: String? = nil
    @objc dynamic var comments_url: String? = nil
    @objc dynamic var issue_comment_url: String? = nil
    @objc dynamic var contents_url: String? = nil
    @objc dynamic var compare_url: String? = nil
    @objc dynamic var merges_url: String? = nil
    @objc dynamic var archive_url: String? = nil
    @objc dynamic var downloads_url: String? = nil
    @objc dynamic var issues_url: String? = nil
    @objc dynamic var pulls_url: String? = nil
    @objc dynamic var milestones_url: String? = nil
    @objc dynamic var notifications_url: String? = nil
    @objc dynamic var labels_url: String? = nil
    @objc dynamic var releases_url: String? = nil
    @objc dynamic var deployments_url: String? = nil
    @objc dynamic var created_at: String? = nil
    @objc dynamic var updated_at: String? = nil
    @objc dynamic var pushed_at: String? = nil
    @objc dynamic var git_url: String? = nil
    @objc dynamic var ssh_url: String? = nil
    @objc dynamic var clone_url: String? = nil
    @objc dynamic var svn_url: String? = nil
    @objc dynamic var homepage: String? = nil
    @objc dynamic var size: Int = 0
    @objc dynamic var stargazers_count: Int = 0
    @objc dynamic var watchers_count: Int = 0
    @objc dynamic var language: String? = nil
    @objc dynamic var has_issues: Bool = false
    @objc dynamic var has_projects: Bool = false
    @objc dynamic var has_downloads: Bool = false
    @objc dynamic var has_wiki: Bool = false
    @objc dynamic var has_pages: Bool = false
    @objc dynamic var forks_count: Int = 0
    @objc dynamic var mirror_url: String? = nil
    @objc dynamic var archived: Bool = false
    @objc dynamic var open_issues_count: Int = 0
    @objc dynamic var license: LicenseModel?
    @objc dynamic var forks: Int = 0
    @objc dynamic var open_issues: Int = 0
    @objc dynamic var watchers: Int = 0
    @objc dynamic var default_branch: String? = nil
    
    var commits: [CommitDataModel]?
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case full_name
        case owner
        case welcome_private
        case html_url
        case _description = "description"
        case fork
        case url
        case forks_url
        case keys_url
        case collaborators_url
        case teams_url
        case hooks_url
        case issue_events_url
        case events_url
        case assignees_url
        case branches_url
        case tags_url
        case blobs_url
        case git_tags_url
        case git_refs_url
        case trees_url
        case statuses_url
        case languages_url
        case stargazers_url
        case contributors_url
        case subscribers_url
        case subscription_url
        case commits_url
        case git_commits_url
        case comments_url
        case issue_comment_url
        case contents_url
        case compare_url
        case merges_url
        case archive_url
        case downloads_url
        case issues_url
        case pulls_url
        case milestones_url
        case notifications_url
        case labels_url
        case releases_url
        case deployments_url
        case created_at
        case updated_at
        case pushed_at
        case git_url
        case ssh_url
        case clone_url
        case svn_url
        case homepage
        case size
        case stargazers_count
        case watchers_count
        case language
        case has_issues
        case has_projects
        case has_downloads
        case has_wiki
        case has_pages
        case forks_count
        case mirror_url
        case archived
        case open_issues_count
        case license
        case forks
        case open_issues
        case watchers
        case default_branch
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
