//
//  NewsCell.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 10.10.2022.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    static let reuseID = String(describing: NewsCell.self)
    
   
    let titleLabel = ENTitleLabel(textAlignment: .left, fontSize: 30)
    let imageView = ENNewsImageView(frame: .zero)
    let dateLabel = ENTimeLabel(fontSize: 20)
    let authorLabel = ENAuthorLabel(textAlignment: .left, fontSize: 20)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        createShadow()
        addSubview(titleLabel)
        addSubview(imageView)
        addSubview(dateLabel)
        addSubview(authorLabel)
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            dateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            dateLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            authorLabel.heightAnchor.constraint(equalTo: dateLabel.heightAnchor)
        ])
    }
    
    func set(newsModel : News) {
        titleLabel.text = newsModel.title
        imageView.image = UIImage(named: newsModel.imageString)
        dateLabel.text = newsModel.dateString
        authorLabel.text = newsModel.authorString
    }
    
    func createShadow() {
        layer.shadowOpacity = 0.1
        layer.shadowColor = UIColor.secondaryLabel.cgColor
    }
    
}
