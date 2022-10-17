//
//  ResultsCell.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 16.10.2022.
//

import UIKit

class ResultsCell: UICollectionViewCell {
    static let reuseID = String(describing: ResultsCell.self)
    
    let eyeButton = ENBasicButton(imageString: "eye.fill", fontSize: 44)
    let eventTitle = ENTitleLabel(textAlignment: .center, fontSize: 25)
    let teamOneImage = ENNewsImageView(frame: .zero)
    let teamOneName = ENAuthorLabel(textAlignment: .left, fontSize: 30)
    
    let teamOneScore = ENTitleLabel(textAlignment: .center, fontSize: 20)
    let teamTwoScore = ENTitleLabel(textAlignment: .center, fontSize: 20)
    
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
        
        let views = [eventTitle, eyeButton, teamOneImage, teamOneName, teamOneScore, teamTwoImage, teamTwoName, teamTwoScore, dateLabel]
        views.forEach { addSubview($0) }
        
        layer.borderColor = Color.halfGrayColor.cgColor
        layer.borderWidth = 1
        
        teamOneScore.isHidden = true
        teamTwoScore.isHidden = true
        
        NSLayoutConstraint.activate([
            
            eventTitle.topAnchor.constraint(equalTo: topAnchor),
            eventTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            eventTitle.heightAnchor.constraint(equalToConstant: 35),
            eventTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            
            eyeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            eyeButton.heightAnchor.constraint(equalToConstant: 44),
            eyeButton.widthAnchor.constraint(equalTo: eyeButton.heightAnchor),
            
            
            teamOneImage.topAnchor.constraint(equalTo: eventTitle.bottomAnchor, constant: 5),
            teamOneImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            teamOneImage.heightAnchor.constraint(equalToConstant: 44),
            teamOneImage.widthAnchor.constraint(equalToConstant: 44),
            
            
            teamOneName.centerYAnchor.constraint(equalTo: teamOneImage.centerYAnchor),
            teamOneName.leadingAnchor.constraint(equalTo: teamOneImage.trailingAnchor, constant: 30),
            teamOneName.trailingAnchor.constraint(equalTo: trailingAnchor),
            teamOneName.heightAnchor.constraint(equalToConstant: 22),
            
            teamOneScore.topAnchor.constraint(equalTo: teamOneName.topAnchor),
            teamOneScore.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            teamOneScore.heightAnchor.constraint(equalToConstant: 20),
            teamOneScore.widthAnchor.constraint(equalToConstant: 20),
            
            teamTwoImage.topAnchor.constraint(equalTo: teamOneImage.bottomAnchor, constant: 5),
            teamTwoImage.leadingAnchor.constraint(equalTo: teamOneImage.leadingAnchor),
            teamTwoImage.heightAnchor.constraint(equalTo: teamOneImage.heightAnchor),
            teamTwoImage.widthAnchor.constraint(equalTo: teamOneImage.widthAnchor),
            
            teamTwoName.centerYAnchor.constraint(equalTo: teamTwoImage.centerYAnchor),
            teamTwoName.leadingAnchor.constraint(equalTo: teamOneName.leadingAnchor),
            teamTwoName.trailingAnchor.constraint(equalTo: trailingAnchor),
            teamTwoName.heightAnchor.constraint(equalTo: teamOneName.heightAnchor),
            
            teamTwoScore.topAnchor.constraint(equalTo: teamTwoName.topAnchor),
            teamTwoScore.trailingAnchor.constraint(equalTo: teamOneScore.trailingAnchor),
            teamTwoScore.heightAnchor.constraint(equalTo: teamOneScore.heightAnchor),
            teamTwoScore.widthAnchor.constraint(equalTo: teamOneScore.widthAnchor),
            
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: teamTwoImage.bottomAnchor, constant: 5),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    func set(resultData: Events) {
        eventTitle.text = resultData.eventName
        
        teamOneImage.image = UIImage(named: resultData.teamOneImg ?? LogoTeams.t1)
        teamOneName.text = resultData.teamOneName
        teamOneScore.text = resultData.teamOneScore
        
        teamTwoName.text = resultData.teamTwoName
        teamTwoImage.image = UIImage(named: resultData.teamTwoImg ?? LogoTeams.t1)
        teamTwoScore.text = resultData.teamTwoScore
        
        dateLabel.text = resultData.matchDate
        
        eyeButton.addTarget(self, action: #selector(showResults), for: .touchUpInside)
    }
    
    @objc func showResults() {
        eyeButton.isHidden = true
        teamOneScore.isHidden = false
        teamTwoScore.isHidden = false
        
        if Int(teamOneScore.text!)! > Int(teamTwoScore.text!)! {
            teamTwoScore.alpha = 0.5
            teamTwoName.alpha = 0.5
        } else {
            teamOneScore.alpha = 0.5
            teamOneName.alpha = 0.5
        }
        
        
    }
    
}

