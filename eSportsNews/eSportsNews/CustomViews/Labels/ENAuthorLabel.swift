//
//  ENAuthorLabel.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 12.10.2022.
//

import UIKit

class ENAuthorLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        textColor = Color.halfWhiteColor
        font = UIFont.systemFont(ofSize: fontSize, weight: .thin)
        configure()
    }
    
    private func configure() {
        textColor = .white
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.7
        numberOfLines = 4
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
