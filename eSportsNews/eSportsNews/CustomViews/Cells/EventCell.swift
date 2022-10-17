//
//  EventCell.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 16.10.2022.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    static let reuseID = String(describing: EventCell.self)
    
    let bgImageView = ENNewsImageView(frame: .zero)
    let eventName = ENTitleLabel(textAlignment: .left, fontSize: 30)
    let eventDate = ENTimeLabel(fontSize: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        [bgImageView, eventName, eventDate].forEach { addSubview($0) }
        
        bgImageView.alpha = 0.1
        
        backgroundColor = UIColor.black
        
        NSLayoutConstraint.activate([
            bgImageView.topAnchor.constraint(equalTo: topAnchor),
            bgImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            eventDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            eventDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            eventDate.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            eventDate.heightAnchor.constraint(equalToConstant: 20),
            
            eventName.bottomAnchor.constraint(equalTo: eventDate.topAnchor, constant: -10),
            eventName.leadingAnchor.constraint(equalTo: eventDate.leadingAnchor),
            eventName.heightAnchor.constraint(equalToConstant: 30),
            eventName.widthAnchor.constraint(equalTo: eventDate.widthAnchor)
        ])
    }
    
    func set(event: Events) {
        self.eventName.text = event.eventName
        self.eventDate.text = event.eventDate
        self.bgImageView.image = UIImage(named: event.eventImg!)
    }
    
}
