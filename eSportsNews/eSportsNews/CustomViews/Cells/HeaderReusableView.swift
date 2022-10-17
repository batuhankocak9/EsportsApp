//
//  HeaderReusableView.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 17.10.2022.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    static let reuseID = String(describing: HeaderReusableView.self)
    
    let label = ENTitleLabel(textAlignment: .left, fontSize: 30)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    func set(headerTitle: String) {
        label.text = headerTitle
    }
}
