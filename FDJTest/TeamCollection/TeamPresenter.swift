//
//  TeamPresenter.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import Foundation

protocol TeamPresenterDelegate {
    func searchForTeamDidSucceed(teams: [Team])
    func searchForTeamDidFailed(message: String)
}

class TeamPresenter {
    
    let apiHelper = APIHelper()
    
    var delegate: TeamPresenterDelegate // ton view controller
    
    init(delegate: TeamPresenterDelegate) {
        self.delegate = delegate
    }
    
    func searchChampionship(championship : String?) {
        
        if championship! == "" {
            self.delegate.searchForTeamDidFailed(message: "Championship Name should be set.")
        } else {
            
            apiHelper.getChampionship(championship!) { (teams, error) in
                
                if (error == nil) {
                    self.delegate.searchForTeamDidSucceed(teams: teams!)
                } else {
                    self.delegate.searchForTeamDidFailed(message: "Championship doesn't exist.")
                }
                
            }
            
        }
        
    }
    
}

