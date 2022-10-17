//
//  ENTimeLabel.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 12.10.2022.
//

import UIKit

class ENTimeLabel: UILabel {

    override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        init(fontSize: CGFloat) {
            super.init(frame: .zero)
            font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
            configure()
        }
        
        private func configure() {
            textColor = Color.halfGrayColor
            numberOfLines = 1
            translatesAutoresizingMaskIntoConstraints = false
        }
}
