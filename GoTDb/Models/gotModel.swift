//
//  gotModel.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/22/22.
//

import Foundation

struct battlesArray:Identifiable{
    var id:Int {battleNo}
    var battleNo:Int
    var battleName:String?
    var battleYear:Int?
    var AttackingKing:String?
    var DefendingKing:String?
    var AttackerOutcome:String?
    var location:String?
    var region:String?
}

struct charactersArray:Hashable{
    //let id:UUID
    let characterName:String
    let Allegiance:String?
    let DeathYear:Int?
    let BookApperance:String?
    let BookDeath:String?
    
}

struct seasonsArray:Identifiable{
    var id:Int {season}
    let season:Int
    let ratings:Double
    let views:Double
    
}

struct episodesArray:Identifiable{
    var id:Int {episode}
    let title:String
    let season:Int
    let episode:Int
    let airDate:String?
    let rating:Double?
    let views:Double?
}
