//
//  ENNewsImageView.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 12.10.2022.
//

import UIKit

class ENNewsImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
}
