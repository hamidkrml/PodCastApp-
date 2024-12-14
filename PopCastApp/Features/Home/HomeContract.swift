//
//  HomeContract.swift
//  PopCastApp
//
//  Created by hamid on 14.12.24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
    func showMessaeg(message:String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    func onLikePressed(index:Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    func saveLikeIndexToDatabase(index:Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    func showSucsessMesaage()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    func navigateToDetail()
}
