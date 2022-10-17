//
//  Events.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 13.10.2022.
//

import Foundation




struct Events: Hashable {
    let id = UUID()
    
    //    GAMES
    
    var gameImage: String?
    
    
    // Matches
    var teamOneName: String?
    var teamOneImg: String?
    var teamOneScore: String?
    
    var teamTwoName: String?
    var teamTwoImg: String?
    var teamTwoScore: String?
    
    var matchDate: String?
    var eventName: String?
    var eventImg: String?
    var eventDate: String?
    
    init(gameImage: String) {
        self.gameImage = gameImage
    }
    
    init(eventName: String, eventDate: String, team1Name: String, team1Img: String, team1Score: String, team2Name: String, team2Img: String, team2Score: String) {
        self.eventName = eventName
        self.matchDate = eventDate
        
        self.teamOneName = team1Name
        self.teamOneImg = team1Img
        self.teamOneScore = team1Score
        
        self.teamTwoName = team2Name
        self.teamTwoImg = team2Img
        self.teamTwoScore = team2Score
    }
    
    init(team1Name: String, team1Img: String, team2Name: String, team2Img: String, matchDate: String) {
        self.teamOneName = team1Name
        self.teamOneImg = team1Img
        
        self.teamTwoName = team2Name
        self.teamTwoImg = team2Img
        
        self.matchDate = matchDate
    }
    
    init(eventName: String, eventImage: String, eventDate: String) {
        self.eventName = eventName
        self.eventImg = eventImage
        self.eventDate = eventDate
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
}

