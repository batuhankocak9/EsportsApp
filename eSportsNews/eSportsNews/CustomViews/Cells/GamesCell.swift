//
//  MatchesCell.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 13.10.2022.
//

import UIKit

class GamesCell: UICollectionViewCell {
    static let reuseID = String(describing: GamesCell.self)
    
    
    let imageView = ENNewsImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(imageView)
        
        imageView.layer.cornerRadius = bounds.width / 2
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.red.cgColor
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func set(event gameImage: Events) {
        self.imageView.image = UIImage(named: gameImage.gameImage ?? LogoImages.lol)
    }
}

