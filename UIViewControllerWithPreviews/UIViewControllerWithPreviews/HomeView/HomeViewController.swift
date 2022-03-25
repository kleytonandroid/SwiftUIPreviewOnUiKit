//
//  HomeViewController.swift
//  UIViewControllerWithPreviews
//
//  Created by Kleyton Santos on 24/03/22.
//

import UIKit
class HomeViewController: UIViewController {
    
    var homeView: HomeView? = nil
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHomeView()
    }
    
    func setupHomeView() {
        view = HomeView()
        homeView = view as? HomeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Test"
    }
}

#if canImport(swiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct HomeViewControllerPreview: PreviewProvider {
    static var previews: some View {
        UINavigationController(rootViewController: HomeViewController()).preview
    }
}
#endif

