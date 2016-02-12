//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  
  var businesses: [Business]!
  var searchBar: UISearchBar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 160
    tableView.keyboardDismissMode = .OnDrag
    
    navigationController?.navigationBar.barTintColor = UIColor(red:0.772, green:0.103, blue:0.003, alpha:1)
    
    searchBar = UISearchBar()
    searchBar.tintColor = UIColor.whiteColor()
    searchBar.delegate = self
    searchBar.sizeToFit()
    navigationItem.titleView = searchBar

    Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
      self.businesses = businesses
      self.tableView.reloadData()
    })

    /* Example of Yelp search with more search options specified
    Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
        self.businesses = businesses
        
        for business in businesses {
            print(business.name!)
            print(business.address!)
        }
    }
    */
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension BusinessesViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let businesses = businesses {
      return businesses.count
    }
    else {
      return 0
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
    
    cell.business = businesses[indexPath.row]
    
    return cell
  }
}

extension BusinessesViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    if let searchText = searchBar.text {
      Business.searchWithTerm(searchText, completion: { (businesses: [Business]!, error: NSError!) -> Void in
        self.businesses = businesses
        self.tableView.reloadData()
      })
    }
  }
  
  func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
    searchBar.setShowsCancelButton(true, animated: true)
    return true;
  }
  
  func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
    searchBar.setShowsCancelButton(false, animated: true)
    return true;
  }
  
  func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    searchBar.text = ""
    searchBar.resignFirstResponder()
  }
}






