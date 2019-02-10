//
//  TeamModel.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import ObjectMapper

class Teams: Mappable {
    var teams: [Team]!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        teams <- map["teams"]
    }
}

class Team: Mappable {
    
    var idTeam: String!
    var strTeam: String!
    var strTeamBadge: String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        idTeam <- map["idTeam"]
        strTeam <- map["strTeam"]
        strTeamBadge <- map["strTeamBadge"]
    }
    
}
