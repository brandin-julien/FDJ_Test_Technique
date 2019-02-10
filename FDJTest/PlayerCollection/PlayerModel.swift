//
//  PlayerModel.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import Foundation
import ObjectMapper

class Players: Mappable {
    var players: [Player]!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        players <- map["player"]
    }
}

class Player: Mappable {
    
    var idPlayer: String!
    var strPlayer: String!
    var strPosition: String!
    var dateBorn: String!
    var strSigning: String!
    var strThumb: String!
    var strCutout: String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        idPlayer <- map["idPlayer"]
        strPlayer <- map["strPlayer"]
        strPosition <- map["strPosition"]
        dateBorn <- map["dateBorn"]
        strSigning <- map["strSigning"]
        strThumb <- map["strThumb"]
        strCutout <- map["strCutout"]
    }
    
}
