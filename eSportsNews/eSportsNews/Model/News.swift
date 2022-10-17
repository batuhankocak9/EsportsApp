//
//  News.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 10.10.2022.
//

import Foundation



struct News: Hashable {
    let id = UUID()
    let title: String
    let imageString: String
    let comment: String
    let dateString: String
    let authorImage: String
    let authorString: String
    let gameType: GameType
    let bodyText: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


enum GameType {
    case lol, csgo
}

