//
//  NewsVC.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 12.10.2022.
//

import UIKit

class NewsVC: UIViewController {
    
    
    static let reuseID = String(describing: NewsVC.self)
    
    var news: News!
    let dismissButton = ENBasicButton(frame: .zero)
    let scrollView = UIScrollView()
    let contentView = UIView()
    let imageView = UIImageView()
    let cardView = NewsCardView(frame: .zero)
    let label = ENTimeLabel(fontSize: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = Color.backgroundColor
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(cardView)
        contentView.addSubview(label)
        contentView.addSubview(dismissButton)
        
        label.numberOfLines = 0
        label.text = news.bodyText
        imageView.image = UIImage(named: news.imageString)
        imageView.clipsToBounds = true
        imageView.alpha = 0.8
        
        dismissButton.addTarget(self, action: #selector(dismissBtn), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
              imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
              imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
              imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.40),
            
            dismissButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dismissButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dismissButton.heightAnchor.constraint(equalToConstant: 44),
            dismissButton.widthAnchor.constraint(equalTo: dismissButton.heightAnchor),
            
            cardView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -50),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cardView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            
            label.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func dismissBtn() {
        dismiss(animated: true, completion: nil)
    }
}
