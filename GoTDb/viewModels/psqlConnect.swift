//
//  psqlConnect.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/20/22.
//

import Foundation
import PostgresClientKit

class psqlConnect:ObservableObject{
    
    @Published var battleArray:[battlesArray] = []
    @Published var characterArray:[charactersArray] = []
    @Published var selectedCharacter:[charactersArray] = []
    @Published var seasonArray:[seasonsArray] = []
    @Published var episodeArray:[episodesArray] = []
    
    
    
    func connectNow(){
        battleArray.removeAll()
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "localhost"
            configuration.database = "gotdata"
            configuration.user = "postgres"
            configuration.ssl = false
            configuration.credential = .scramSHA256(password: "5067")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT * FROM battles"
            
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            
            let cursor = try statement.execute(parameterValues: [])
           
            defer { cursor.close() }
           
            for row in cursor {
                //print("trying...sending work")
                let columns = try row.get().columns
                let BattleNo = try columns[0].int()
                let BattleName = try columns[1].string()
                let BattleYear = try columns[2].int()
                let AttackingKing = try columns[3].optionalString()
                let DefendingKing = try columns[4].optionalString()
                let AttackerOutcome = try columns[5].optionalString()
                let location = try columns[6].optionalString()
                let region = try columns[7].optionalString()
                
                battleArray.append(battlesArray(battleNo: BattleNo, battleName: BattleName, battleYear: BattleYear, AttackingKing: AttackingKing, DefendingKing: DefendingKing, AttackerOutcome: AttackerOutcome, location: location, region: region))
                
//                print("BattleNo: \(BattleNo), BattleName: \(BattleName), BattleYear:\(BattleYear), AttackingKing:\(AttackingKing), DefendingKing:\(DefendingKing), location:\(location), region:\(region)")
            }
        } catch {
            print("we landed here")
            print(error) // better error handling goes here
        }
    }
    
    
    
    func createCharacterArray(){
        characterArray.removeAll()
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "localhost"
            configuration.database = "gotdata"
            configuration.user = "postgres"
            configuration.ssl = false
            configuration.credential = .scramSHA256(password: "5067")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT * FROM characters"
            
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            
            let cursor = try statement.execute(parameterValues: [])
           
            defer { cursor.close() }
           
            for row in cursor {
                //print("trying...sending work")
                let columns = try row.get().columns
                let characterName = try columns[0].string()
                let allegiance = try columns[1].optionalString()
                let deathYear = try columns[2].optionalInt()
                let bookApperaence = try columns[3].optionalString()
                let bookDeath = try columns[4].optionalString()
                
                characterArray.append(charactersArray(characterName: characterName, Allegiance: allegiance, DeathYear: deathYear, BookApperance: bookApperaence, BookDeath: bookDeath))
//                print("BattleNo: \(BattleNo), BattleName: \(BattleName), BattleYear:\(BattleYear), AttackingKing:\(AttackingKing), DefendingKing:\(DefendingKing), location:\(location), region:\(region)")
            }
        } catch {
            print("we landed here")
            print(error) // better error handling goes here
        }
    }
    
    
    
    
    func selectCharacterInfo(cName:String){
        selectedCharacter.removeAll()
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "localhost"
            configuration.database = "gotdata"
            configuration.user = "postgres"
            configuration.ssl = false
            configuration.credential = .scramSHA256(password: "5067")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT * FROM characters WHERE name = $1"
            
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            
            let cursor = try statement.execute(parameterValues: [cName])
           
            defer { cursor.close() }
           
            for row in cursor {
                //print("trying...sending work")
                let columns = try row.get().columns
                let characterName = try columns[0].string()
                let allegiance = try columns[1].optionalString()
                let deathYear = try columns[2].optionalInt()
                let bookApperaence = try columns[3].optionalString()
                let bookDeath = try columns[4].optionalString()
                
                selectedCharacter.append(charactersArray(characterName: characterName, Allegiance: allegiance, DeathYear: deathYear, BookApperance: bookApperaence, BookDeath: bookDeath))
            }
        } catch {
            print("we landed here")
            print(error) // better error handling goes here
        }
        
    }
    
    
    func createSeasonsArray(){
        seasonArray.removeAll()
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "localhost"
            configuration.database = "gotdata"
            configuration.user = "postgres"
            configuration.ssl = false
            configuration.credential = .scramSHA256(password: "5067")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT * FROM seasons ORDER BY season"
            
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            
            let cursor = try statement.execute(parameterValues: [])
           
            defer { cursor.close() }
           
            for row in cursor {
                //print("trying...sending work")
                let columns = try row.get().columns
                let seasonNum = try columns[0].int()
                let ratingsNum = try columns[1].double()
                let viewsNum = try columns[2].double()
                
                seasonArray.append(seasonsArray(season: seasonNum, ratings: ratingsNum, views: viewsNum))
               
            }
        } catch {
            print("we landed here")
            print(error) // better error handling goes here
        }
    }
    
    func createEpisodesArray(seasonNo:Int){
        episodeArray.removeAll()
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "localhost"
            configuration.database = "gotdata"
            configuration.user = "postgres"
            configuration.ssl = false
            configuration.credential = .scramSHA256(password: "5067")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT * FROM episodes WHERE season = $1"
            
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            
            let cursor = try statement.execute(parameterValues: [seasonNo])
           
            defer { cursor.close() }
           
            for row in cursor {
                //print("trying...sending work")
                let columns = try row.get().columns
                let title = try columns[0].string()
                let seasonNum = try columns[1].int()
                let episodeNum = try columns[2].int()
                let airDate = try columns[3].optionalString()
                let ratings = try columns[4].optionalDouble()
                let views = try columns[5].optionalDouble()
                
                episodeArray.append(episodesArray(title: title, season: seasonNum, episode: episodeNum, airDate: airDate, rating: ratings, views: views))
               
            }
        } catch {
            print("we landed here")
            print(error) // better error handling goes here
        }
    }
    
    func getEpisodeDetails(seasonNo:Int, episodeNo:Int){
        episodeArray.removeAll()
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "localhost"
            configuration.database = "gotdata"
            configuration.user = "postgres"
            configuration.ssl = false
            configuration.credential = .scramSHA256(password: "5067")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT * FROM episodes WHERE season = $1 AND episode = $2"
            
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            
            let cursor = try statement.execute(parameterValues: [seasonNo, episodeNo])
           
            defer { cursor.close() }
           
            for row in cursor {
                //print("trying...sending work")
                let columns = try row.get().columns
                let title = try columns[0].string()
                let seasonNum = try columns[1].int()
                let episodeNum = try columns[2].int()
                let airDate = try columns[3].optionalString()
                let ratings = try columns[4].optionalDouble()
                let views = try columns[5].optionalDouble()
                
                print(title)
                
                episodeArray.append(episodesArray(title: title, season: seasonNum, episode: episodeNum, airDate: airDate, rating: ratings, views: views))
               
            }
        } catch {
            print("we landed here")
            print(error) // better error handling goes here
        }
    }
    
    
    
    func printArray(){
        print(battleArray)
    }
    
    
}
