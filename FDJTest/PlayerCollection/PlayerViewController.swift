//
//  PlayerViewController.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import UIKit

class PlayerViewController: UITableViewController {
    
    var presenter : PlayerPresenter!
    var player : Player!
    var team : Team?
    var data: [Player] = []
    
    @IBOutlet var playerTableView: UITableView!
    
    override func viewDidLoad() {
        presenter = PlayerPresenter(delegate: self)
        self.playerTableView.delegate = self
        self.playerTableView.rowHeight = 150.0
        navigationController?.title = team?.strTeam!
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.topViewController?.title = "\(team?.strTeam ?? "Unknow name" )"
        
        getPlayers()
        super.viewDidLoad()
    }
    
    func getPlayers() {
        self.presenter.searchTeam(team: team?.strTeam)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let player = self.data[indexPath.item]
        
        let identifier = "PlayerCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath )
        
        guard let myCell = cell as? PlayerTableViewCell else {
            return  UITableViewCell()
        }
        
        myCell.config(player: player)

        return cell
    }
}

extension PlayerViewController: PlayerPresenterDelegate {
    
    func searchForPlayerDidSucceed(player: [Player]) {
        self.data = player
        self.playerTableView.reloadData()
    }
    
    func searchForplayerDidFailed(message: String) {
        navigationController?.popViewController(animated: true)
        displayErrorAlert(title: "Error", message: message)
    }
    
}
