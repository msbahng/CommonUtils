//
//  SearchTableViewController.swift
//  PositionAlarm
//
//  Created by Mooseok Bahng on 2018. 5. 3..
//  Copyright © 2018년 Mooseok Bahng. All rights reserved.
//

import UIKit
import MapKit

public protocol SearchTableViewContollerDelegate {
    func locationSelected(_ location: CLLocationCoordinate2D)
}

class SearchTableViewController: UITableViewController {

    private var searchController: UISearchController!
    private var searchResults: [MKMapItem]?
    var searchDelegate: SearchTableViewContollerDelegate?
        
    static func createInstance(delegate: SearchTableViewContollerDelegate) -> SearchTableViewController? {
        let storyboard = UIStoryboard(name: "SearchTableViewController", bundle: Bundle.module)
        let controller = storyboard.instantiateInitialViewController() as? Self
        
        controller?.searchDelegate = delegate
        
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "search placeholder"
        
        self.navigationItem.searchController = searchController                
        self.navigationItem.title = "search title"
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        searchController.isActive = true
    }
    
    private func hideSearchUI(_ location: CLLocationCoordinate2D? = nil) {
        
        self.navigationController?.dismiss(animated: true, completion: { [weak self] in
          
            guard let location = location else {
                return
            }

            self?.searchDelegate?.locationSelected(location)
        })
    }
    
    func search(query: String, withRegion region: MKCoordinateRegion?) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        if let region = region {
            request.region = region
        }
        
        MKLocalSearch(request: request).start { (response: MKLocalSearch.Response?, error: Error?) in
            if error != nil {
                return
            }
            
            self.searchResults = response?.mapItems
            
            DispatchQueue.main.async {
                
                if self.searchResults != nil {
                    print("search result : \(self.searchResults!.count)")
                }
                
                self.tableView.reloadData()
            }
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchResults == nil {
            return 0
        } else {
            return self.searchResults!.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
        
        if indexPath.row < self.searchResults?.count ?? 0 {
            if let mapItem = self.searchResults?[indexPath.row] {
                
                cell.textLabel?.text = mapItem.name
                cell.detailTextLabel?.text = mapItem.placemark.makeAddressString()
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row < self.searchResults?.count ?? 0 {
            if let mapItem = self.searchResults?[indexPath.row] {
                
                let location = mapItem.placemark.coordinate
                self.hideSearchUI(location)
            }
        }
    }
}


// MARK: - UISearchBarDelegate

extension SearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchUI()
    }
}

// MARK: - UISearchControllerDelegate

extension SearchTableViewController: UISearchControllerDelegate {
    
    func presentSearchController(_ searchController: UISearchController) {
        debugPrint("presentSearchController")
        searchController.searchBar.becomeFirstResponder()
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        //debugPrint("UISearchControllerDelegate invoked method: \(__FUNCTION__).")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        debugPrint("didPresentSearchController")
        
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        //debugPrint("UISearchControllerDelegate invoked method: \(__FUNCTION__).")
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        debugPrint("didDismissSearchController")
        
    
    }
    
}


extension SearchTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let text = searchController.searchBar.text ?? ""
        print(text)
        
        self.search(query: text, withRegion: nil)
    }
}


