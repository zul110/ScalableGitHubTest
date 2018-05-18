//
//  ReposViewModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

// Derive from BaseViewModel to include the network functionalities
class ReposViewModel: BaseViewModel {
    // MARK: Properties
    var repos: [RepoModel] = []                 // Temporary storage for convenient use
    var persistentRepos: Results<RepoModel>!    // Persistent storage (Realm)
    
    var delegate: ViewModelDelegate!            // Delegate
    
    // MARK: Constructor (BaseViewModel does not have a constructor for this app)
    override init() {
        super.init()
        
        // Get the API to be used in this ViewModel
        self.apiToUse = API.REPOS
        
        // Configure and set up Realm
        self.configureRealm()
        self.setupPersistentRepos()
    }
    
    // MARK: Functions
    
    // Get the data from either Realm (if it exists), or remotely via the API call
    override func getData() {
        // The data is acquired in the main thread to avoid issues with displaying the data in the table
        // This is because the data is pulled out from Realm when displaying, and thus should be added
        // in the same thread as the one it is read from.
        // Any operation involving read/write operations from Realm will be in the main thread.
        DispatchQueue.main.async {
            if let storedRepos = self.persistentRepos, storedRepos.count > 0 {
                print("Restoring from persistent storage")
                
                self.repos = storedRepos.map { $0 }
                self.delegate.didGetDataSuccessfully()
            } else {
                print("Getting remote response")
                
                self.deletePersistentRepos()
                
                self.getGetResponse(self.apiToUse, parameters: [], success: self.success, failure: self.failure)
            }
        }
    }
    
    // When the data is acquired successfully
    override func success(responseData: Data) {
        print("SUCCESS REPOS")
        
        // Try to parse the JSON data into a temporary array
        guard let repos = try? JSONDecoder().decode(Array<RepoModel>.self, from: responseData) else {
            print("Error: Couldn't decode data into Repos")
            return
        }
        
        // Map the data into the ViewModel's array, and store each repo in the persistent storage (Realm)
        self.repos = repos
            .map {
                (repo: RepoModel) -> RepoModel in
                DispatchQueue.main.async {
                    guard let realm = try? Realm() else {
                        return
                    }
                    
                    do {
                        try realm.write {
                            realm.add(repo)
                        }
                    } catch {
                        print("Could not wirte \((repo.name)!) into Realm")
                    }
                }
                
                return repo
        }
        
        // Notify delegates about the success
        self.delegate.didGetDataSuccessfully()
        
        self.displayData()
    }
    
    // Notify the delegates about the failure
    override func failure(error: ErrorModel, responseData: Data?, statusCode: Int) {
        print("REPOS VM FAILED \(statusCode)")
        
        self.delegate.didFailGettingData(error)
    }
    
    // Display data
    override func displayData() {
        DispatchQueue.main.async {
            print((self.repos[0].owner?.login)!)
        }
    }
}
