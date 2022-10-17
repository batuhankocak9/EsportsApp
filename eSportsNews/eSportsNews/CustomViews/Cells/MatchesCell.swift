//
//  MatchesCell.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 13.10.2022.
//

import UIKit

class MatchesCell: UICollectionViewCell {
    static let reuseID = String(describing: MatchesCell.self)
    
    let teamOneImage = ENNewsImageView(frame: .zero)
    let teamOneName = ENAuthorLabel(textAlignment: .left, fontSize: 30)
    let teamTwoImage = ENNewsImageView(frame: .zero)
    let teamTwoName = ENAuthorLabel(textAlignment: .left, fontSize: 30)
    let dateLabel = ENTimeLabel(fontSize: 18)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        let views = [teamOneImage, teamOneName, teamTwoImage, teamTwoName, dateLabel]
        views.forEach { addSubview($0) }
        
        layer.borderColor = Color.halfGrayColor.cgColor
        layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            teamOneImage.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            teamOneImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            teamOneImage.heightAnchor.constraint(equalToConstant: 44),
            teamOneImage.widthAnchor.constraint(equalToConstant: 44),
            
            
            teamOneName.centerYAnchor.constraint(equalTo: teamOneImage.centerYAnchor),
            teamOneName.leadingAnchor.constraint(equalTo: teamOneImage.trailingAnchor, constant: 30),
            teamOneName.trailingAnchor.constraint(equalTo: trailingAnchor),
            teamOneName.heightAnchor.constraint(equalToConstant: 22),
            
            teamTwoImage.topAnchor.constraint(equalTo: teamOneImage.bottomAnchor, constant: 5),
            teamTwoImage.leadingAnchor.constraint(equalTo: teamOneImage.leadingAnchor),
            teamTwoImage.heightAnchor.constraint(equalTo: teamOneImage.heightAnchor),
            teamTwoImage.widthAnchor.constraint(equalTo: teamOneImage.widthAnchor),
            
            teamTwoName.centerYAnchor.constraint(equalTo: teamTwoImage.centerYAnchor),
            teamTwoName.leadingAnchor.constraint(equalTo: teamOneName.leadingAnchor),
            teamTwoName.trailingAnchor.constraint(equalTo: trailingAnchor),
            teamTwoName.heightAnchor.constraint(equalTo: teamOneName.heightAnchor),
            
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: teamTwoImage.bottomAnchor, constant: 5),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    func set(matchData: Events) {
        teamOneImage.image = UIImage(named: matchData.teamOneImg ?? LogoTeams.t1)
        teamOneName.text = matchData.teamOneName
        
        teamTwoName.text = matchData.teamTwoName
        teamTwoImage.image = UIImage(named: matchData.teamTwoImg ?? LogoTeams.t1)
        
        dateLabel.text = matchData.matchDate
    }
}
