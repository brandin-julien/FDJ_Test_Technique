//
//  TeamViewController.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var teamCollectionView: UICollectionView!
    
    var presenter : TeamPresenter!
    
    var data:[Team] = []
    
    override func viewDidLoad() {
        self.initSearchBar()
        setNavigationBar()
        presenter = TeamPresenter(delegate: self)
        teamCollectionView.dataSource = self
        teamCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    func setNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.presenter.searchChampionship(championship: searchBar.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "seePlayers" {
            let playerViewController =  segue.destination as! PlayerViewController
            playerViewController.team = sender as? Team
        }
        
    }
    
}

extension TeamViewController: UISearchBarDelegate {
    
    func initSearchBar() {
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search by league"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            resetSearchBar()
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != "" {
            resetSearchBar()
        }
        
    }
    
    func resetSearchBar(){
        searchBar.text = ""
        if !self.data.isEmpty{
            self.data = []
            teamCollectionView.reloadData()
        }
    }
    
}

extension TeamViewController: TeamPresenterDelegate {
    
    func searchForTeamDidSucceed(teams: [Team]) {
        self.data = teams
        DispatchQueue.main.async {
            self.teamCollectionView.reloadData()
        }
    }
    
    func searchForTeamDidFailed(message: String) {
        displayErrorAlert(title: "Error", message: message)
    }
    
}

extension TeamViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let team = self.data[indexPath.item]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as? TeamCollectionViewCell {
            cell.setUpCell(team)
            return cell
        }
        return UICollectionViewCell()
    }
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let with = UIScreen.main.bounds.width / 2 - 15
        let height = CGFloat(195)
        
        return CGSize(width: with, height: height)
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let layout = collectionView.layoutAttributesForItem(at: indexPath) else{ return }
        
        let team = self.data[indexPath.item]
        
        self.performSegue(withIdentifier: "seePlayers", sender: team)
        
    }
    
}
