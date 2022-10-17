//
//  NewsCardView.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 12.10.2022.
//

import UIKit

class NewsCardView: UIView {
    
    var news: News!
    
    let gameIconImageView = ENNewsImageView(frame: .zero)
    let gameNameLabel = ENTimeLabel(fontSize: 17)
    let dateLabel = ENTimeLabel(fontSize: 14)
    let titleLabel = ENTitleLabel(textAlignment: .left, fontSize: 35)
    let commentLabel = ENAuthorLabel(textAlignment: .left, fontSize: 20)
    let authorImageView = ENNewsImageView(frame: .zero)
    let authorLabel = ENAuthorLabel(textAlignment: .left, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news: News) {
        self.dateLabel.text = news.dateString
        self.titleLabel.text = news.title
        self.commentLabel.text = news.comment
        self.authorImageView.image = UIImage(named: news.authorImage)
        self.authorLabel.text = news.authorString
        
        switch news.gameType {
        case .lol:
            gameIconImageView.image = UIImage(named: "lolLogo.png")
            gameNameLabel.text = "League of Legends"
        case .csgo:
            gameIconImageView.image = UIImage(named: "csgoLogo.png")
            gameNameLabel.text = "CS:GO"
        }
    }
    
    private func configure() {
        let views = [gameIconImageView, gameNameLabel, dateLabel, titleLabel, commentLabel, authorImageView, authorLabel]
        views.forEach { addSubview($0)}
        backgroundColor = Color.cardBGColor
        
        NSLayoutConstraint.activate([
            gameIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            gameIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            gameIconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            gameIconImageView.widthAnchor.constraint(equalTo: gameIconImageView.heightAnchor),
            
            gameNameLabel.topAnchor.constraint(equalTo: gameIconImageView.topAnchor),
            gameNameLabel.leadingAnchor.constraint(equalTo: gameIconImageView.trailingAnchor, constant: 10),
            gameNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            gameNameLabel.heightAnchor.constraint(equalTo: gameIconImageView.heightAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: gameIconImageView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: gameNameLabel.trailingAnchor, constant: 10),
            dateLabel.heightAnchor.constraint(equalTo: gameIconImageView.heightAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: gameIconImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: gameIconImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            
            commentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            commentLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            commentLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            authorImageView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor),
            authorImageView.leadingAnchor.constraint(equalTo: commentLabel.leadingAnchor),
            authorImageView.heightAnchor.constraint(equalTo: gameIconImageView.heightAnchor),
            authorImageView.widthAnchor.constraint(equalTo: authorImageView.heightAnchor),
            
            authorLabel.centerYAnchor.constraint(equalTo: authorImageView.centerYAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            authorLabel.heightAnchor.constraint(equalTo: authorImageView.heightAnchor)
        ])
    }
    
}
