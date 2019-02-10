//
//  APIHelper.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

typealias championshipCompletion = (_ teams : [Team]?, _ errorStrig : String?) -> Void
typealias TeamCompletion = (_ players : [Player]?, _ errorStrig : String?) -> Void

class APIHelper {
    
    private let _baseURL = "https://www.thesportsdb.com/api/v1/json/"
    private let _APIKey = "1"
    
    var urlPlayers : String {
        return _baseURL + _APIKey + "/searchplayers.php?t="
    }
    
    var urlTeams : String {
        return _baseURL + _APIKey + "/search_all_teams.php"
    }
    
    public func getChampionship(_ championship: String, completion : @escaping championshipCompletion) {
        
        let parameters: Parameters = ["l": championship]
        
        Alamofire.request(urlTeams, parameters: parameters).responseObject{ (response: DataResponse<Teams>) in
            
            switch response.result {
            case .success:
                let data = response.result.value
                
                if data?.teams != nil {
                    completion(data?.teams, nil)
                }else{
                    completion(nil, "error")
                }
                
            case .failure(let error):
                completion(nil, "Error during connecting to data")
            }
            
        }
    }
    
    public func getPlayersForTeam(_ team: String, completion : @escaping TeamCompletion) {
        
        let parameters: Parameters = ["t": team]
                
        Alamofire.request(urlPlayers, parameters: parameters).responseObject{ (response: DataResponse<Players>) in
            
            switch response.result {
            case .success:
                let data = response.result.value
                
                if data?.players != nil {
                    completion(data?.players, nil)
                }else{
                    completion(nil, "error")
                }
                
            case .failure(let error):
                completion(nil, "Error during connecting to data")
            }
            
        }
        
    }
    
}
