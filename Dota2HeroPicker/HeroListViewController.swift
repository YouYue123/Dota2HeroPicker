//
//  HeroListViewController.swift
//  Dota2HeroPicker
//
//  Created by YouYue on 7/2/17.
//  Copyright © 2017 YouYue. All rights reserved.
//

import Foundation
import UIKit

class HeroListViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    //Allows for pull down to refresh
    var refreshControl: UIRefreshControl!
    //view model of the Feed View controller. It will keep track of state and handle data for this view controller
    var viewModel: HeroListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func setupTableView(){
        Utils.registerNibWith("HeroListCell", tableView: tableView)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(HeroListViewController.userTriggerRefresh), for: UIControlEvents.valueChanged)
        self.refreshControl.isHidden = true
        self.refreshControl.tintColor = UIColor.clear
        
        self.tableView.addSubview(refreshControl)
    }
    
    func setupViewModel(){
        viewModel = HeroListViewModel(notifyVC: handleHeroListViewModelNotifications)
    }
    
    func userTriggerRefresh(){
        self.refreshControl.endRefreshing()
        
    }
}

extension HeroListViewController: UITableViewDataSource{
    /*
     Method returns the number of sections in the table view
        - returns: Int
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSections(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.setupTableViewCell(indexPath,tableView: tableView)
//        if let cell = cell as? HeroListCell {
//            let testGesture = UITapGestureRecognizer(target: self, action)
//        }
        return cell
    }
}

extension HeroListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
}

// ViewModel -> ViewController Communication
extension HeroListViewController {
    func handleHeroListViewModelNotifications(_ heroListViewModelNotification: HeroListNotification){
        switch heroListViewModelNotification {
            case .noSearchResult:
                print("noSearchResult")
            case .reloadTableView:
                print("reloadTableView")
        }
    }
    
}
