//
//  CommitsViewModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation

class CommitsViewModel: BaseViewModel {
    var repoName: String!
    
    var commits: [CommitDataModel] = []
    
    var delegate: ViewModelDelegate!
    
    init(_ repoName: String) {
        super.init()
        
        self.repoName = repoName
        self.apiToUse = API.COMMITS
        
        self.getData()
    }
    
    override func getData() {
        self.getGetResponse(self.apiToUse.replacingOccurrences(of: "{repo}", with: self.repoName), parameters: [], success: self.success, failure: self.failure)
    }
    
    override func success(responseData: Data) {
        print("SUCCESS COMMIT VM: \(self.repoName)")
        
        guard let commits = try? JSONDecoder().decode([CommitDataModel].self, from: responseData) else {
            print("Error: Couldn't decode data into CommitDataModel")
            
            self.error = ErrorModel(errorType: .json, statusCode: 0, message: "Error: Couldn't decode data into CommitDataModel")
            self.failure(error: self.error, responseData: nil, statusCode: 0)
            
            return
        }
        
        self.commits = commits
        
        self.delegate.didGetDataSuccessfully()
    }
    
    override func failure(error: ErrorModel, responseData: Data?, statusCode: Int) {
        print("FAILED COMMIT VM (\(statusCode): \(self.repoName)")
        
        self.delegate.didFailGettingData(error)
    }
    
    override func displayData() {
        print((self.commits[0].commit?.author?.name)!)
    }
}
