//
//  Events+Stubs.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 15.10.2022.
//

import Foundation


extension Events {
   
    static let games = [Events(gameImage: LogoImages.lol), Events(gameImage: LogoImages.csgo), Events(gameImage: LogoImages.valorant), Events(gameImage: LogoImages.overwatch)]
    
    static let matches = [Events(team1Name: "T1", team1Img: LogoTeams.t1, team2Name: "G2", team2Img: LogoTeams.g2, matchDate: "12:00 AM"), Events(team1Name: "EDG", team1Img: LogoTeams.edg, team2Name: "GenG", team2Img: LogoTeams.genG, matchDate: "01:00 AM"), Events(team1Name: "C9", team1Img: LogoTeams.c9, team2Name: "TOP", team2Img: LogoTeams.top, matchDate: "02:00 AM"), Events(team1Name: "100", team1Img: LogoTeams.t100, team2Name: "Fnatic", team2Img: LogoTeams.fnatic, matchDate: "03:00 AM")]
    
    static let matchResults = [Events(eventName: "Worlds 2022", eventDate: "Finished 10:15", team1Name: "C9", team1Img: LogoTeams.c9, team1Score: "1", team2Name: "EDG", team2Img: LogoTeams.edg, team2Score: "2"), Events(eventName: "Worlds 2022", eventDate: "Finished 11.10", team1Name: "FNC", team1Img: LogoTeams.fnatic, team1Score: "2", team2Name: "G2", team2Img: LogoTeams.g2, team2Score: "1"), Events(eventName: "Worlds 2022", eventDate: "Finished 12.00", team1Name: "100", team1Img: LogoTeams.t100, team1Score: "2", team2Name: "TOP", team2Img: LogoTeams.top, team2Score: "1")]
    
    static let events = [Events(eventName: "Worlds 2022", eventImage: "worlds.png", eventDate: "29 Sep - 6 Nov"), Events(eventName: "Worlds 2023", eventImage: "worlds.png", eventDate: "29 Sep - 6 Nov")]
}
