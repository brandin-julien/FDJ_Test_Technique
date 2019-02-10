//
//  PlayerPresenter.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import Foundation

protocol PlayerPresenterDelegate {
    func searchForPlayerDidSucceed(player: [Player])
    func searchForplayerDidFailed(message: String)
}

class PlayerPresenter {
    
    var delegate : PlayerPresenterDelegate
    var apiHelper = APIHelper()
    
    init (delegate: PlayerPresenterDelegate){
        self.delegate = delegate
    }
    
    func searchTeam(team : String?) {
        if team == nil {
            self.delegate.searchForplayerDidFailed(message: "Team Name should be set.")
        } else {
            apiHelper.getPlayersForTeam(team!) { (players, error) in
                
                if (error == nil) {
                    self.delegate.searchForPlayerDidSucceed(player: players!)
                } else {
                    self.delegate.searchForplayerDidFailed(message: "Team doesn't exist.")
                }
            }
        }
    }
    
}
