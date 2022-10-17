//
//  ENDismissButton.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 12.10.2022.
//

import UIKit

class ENBasicButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(imageString: "xmark.square.fill", fontSize: 44)
    }
    
    init(imageString: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        configure(imageString: imageString, fontSize: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(imageString: String, fontSize: CGFloat) {
        let largeFont = UIFont.systemFont(ofSize: fontSize)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let image = UIImage(systemName: imageString, withConfiguration: configuration)
        tintColor = Color.cardBGColor
        setImage(image, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        imageView?.contentMode = .scaleAspectFit
        
    }
    
}
