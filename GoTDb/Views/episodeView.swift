//
//  battlesView.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/22/22.
//

import Foundation
import SwiftUI
struct episodeView: View {
    @StateObject var connect = psqlConnect()
    var seasonNo:Int
    var seasonRating:Double
    var seasonViews:Double
    @State var showBattle:Bool = false
    @State var episodeNumber:Int = 0
    var body: some View {
        
        VStack{
            Text("Rating: \(seasonRating), Views : \(seasonViews)")
//            Text("Rating: \(seasonRating)")
//            Text("Views : \(seasonViews)")
            List{
                ForEach(connect.episodeArray){
                    episode in
                    Button{
                        episodeNumber = episode.episode
                        //seasonNo = episode.season
                        showBattle.toggle()
                    } label: {
                        Text("\(episode.title)")
                    }
                }//end of ForEach
            }//end of list
            .sheet(isPresented: $showBattle){
                episodeDetails(episodeNum: episodeNumber, seasonNum: seasonNo)
            }
        .navigationTitle("Season: \(seasonNo)")
        }//end of Vstack
        .onAppear{
            connect.createEpisodesArray(seasonNo: seasonNo)
        }
        
    }
}


struct testView: View{
    var body: some View{
        VStack{
          Text("we are in test area")
        }
    }
}
