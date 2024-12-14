//
//  HomeView.swift
//  PopCastApp
//
//  Created by hamid on 14.12.24.
//  
//

import UIKit

final class HomeView: BaseView<HomeViewController> {
    override func setupView() {
        super.setupView()
        setupLayout()
        setupConstraints()
    }

    /// sample method to setup layout
    private lazy var podcastTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.defaultTheme.themeFont.subtitleFontBoldSize
        return label
    }()

    private func setupLayout() {
        addSubview(podcastTitleLabel)
    }
    
    func setupConstraints() {
        podcastTitleLabel.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
    }

}
