//
//  charactersView.swift
//  GoTDb
//
//  Created by Javier Bonilla on 11/22/22.
//

import Foundation
import SwiftUI
struct episodeDetails: View {
    var episodeNum:Int
    var seasonNum:Int
    @StateObject var episodeDetails = psqlConnect()
    var body: some View {
        
        VStack{
            if(episodeDetails.episodeArray.count == 0){
                Text("Loading...")
                Text("Please reopen another title to load properly")
                    .font(.title3)
            }
            else{
                Image("tv")
                    .resizable()
                    .frame(width: 380, height: 300)
                    .overlay(
                Text("\(episodeDetails.episodeArray[0].title)")
                    .font(.title3)
                    .frame(alignment: .topLeading)
                    .padding(.trailing, 100)
                
                )//end of overlay
                
                Text("Episode details:")
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text("Season \(episodeDetails.episodeArray[0].season) Episode \(episodeDetails.episodeArray[0].episode)")
                    .padding()
                Text("Original Air Date: \(episodeDetails.episodeArray[0].airDate ?? "unable to load...")")
                    .padding()
                Text("Total Views: \(episodeDetails.episodeArray[0].views ?? 0)")
                    .padding()
                Text("Total Rating: \(episodeDetails.episodeArray[0].rating ?? 0)")
                    .padding()
                
            }
            Spacer()
            
        }
        .onAppear(){
            episodeDetails.getEpisodeDetails(seasonNo: seasonNum, episodeNo: episodeNum)
        }
        
        
    }
}
