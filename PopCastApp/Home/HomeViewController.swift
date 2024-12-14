//
//  HomeViewController.swift
//  PopCastApp
//
//  Created by hamid on 14.12.24.
//  
//

import UIKit
import SwiftUI

final class HomeViewController: UIViewController{
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol!

    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hamit")
        
    }
     
}

extension HomeViewController: PresenterToViewHomeProtocol{
    // TODO: Implement View Output Methods
}
