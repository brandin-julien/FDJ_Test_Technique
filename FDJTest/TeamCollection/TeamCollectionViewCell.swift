//
//  TeamCollectionViewCell.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamImage: UIImageView!
    var team : Team!
    
    func setUpCell(_ team : Team) {
        teamImage.download(team.strTeamBadge)
    }
    
}
