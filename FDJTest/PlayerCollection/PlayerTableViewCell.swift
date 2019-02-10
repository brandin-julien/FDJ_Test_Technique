//
//  PlayerTableViewCell.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerPositionLabel: UILabel!
    @IBOutlet weak var playerDateBornLabel: UILabel!
    @IBOutlet weak var playerPriceLabel: UILabel!
    
    func config(player: Player){
        
        if player.strCutout != nil{
            self.playerImageView.download(player.strCutout)
        }
        else if player.strThumb != nil {
            self.playerImageView.download(player.strThumb)
        }
        
        playerNameLabel.text = "\(player.strPlayer == "" ? "Unknow" : player.strPlayer! )"
        playerPositionLabel.text = "\(player.strPosition == "" ? "Unknow" : player.strPosition! )"
        playerDateBornLabel.text = "birthdate: \(player.dateBorn == "" ? "Unknow" : player.dateBorn! )"
        playerPriceLabel.text = "price: \(player.strSigning == "" ? "Unknow" : player.strSigning! )"
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
}
