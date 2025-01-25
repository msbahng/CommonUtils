//
//  LocationSearchView.swift
//  
//
//  Created by Mooseok Bahng on 2023/07/29.
//

import SwiftUI

public struct LocationSearchView: UIViewControllerRepresentable {
    
    public let delegate: SearchTableViewContollerDelegate
    
    public init(delegate: SearchTableViewContollerDelegate) {
        self.delegate = delegate
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        
        let navController = UINavigationController()
        
        guard let viewController = SearchTableViewController.createInstance(delegate: self.delegate) else {
            return navController
        }
        
        navController.viewControllers = [viewController]
        return navController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
}

