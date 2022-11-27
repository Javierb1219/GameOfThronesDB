//
//  battlesView.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/22/22.
//

import Foundation
import SwiftUI
struct seasonsView: View {
    @StateObject var connect = psqlConnect()
    @State var showBattle:Bool = false
    @State var showId:Int = 1
    var body: some View {
        
        VStack{
            List{
                ForEach(connect.seasonArray){
                    season in
                    NavigationLink(destination:episodeView(seasonNo: season.season, seasonRating: season.ratings, seasonViews: season.views)){
                        Text("Season \(season.season)")
                    }
                }//end of ForEach
            }//end of list
            .sheet(isPresented: $showBattle) {
                detailedBattles(battleArray: connect.battleArray, currId: showId)
            }
        .navigationTitle("Game Of Thrones Seasons")
        }//end of Vstack
        .onAppear{
            connect.createSeasonsArray()
        }
        
    }
}
