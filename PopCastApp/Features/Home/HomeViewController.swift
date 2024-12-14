//
//  HomeViewController.swift
//  PopCastApp
//
//  Created by hamid on 14.12.24.
//  
//

import UIKit

final class HomeViewController: UIViewController, NavigationView {
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = HomeView(self)
        view.backgroundColor = .white
    }
     
}

extension HomeViewController: PresenterToViewHomeProtocol{
    func showMessaeg(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.show(self,sender: nil)
    }
    
    // TODO: Implement View Output Methods
}
