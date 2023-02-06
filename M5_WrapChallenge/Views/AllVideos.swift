//
//  ContentView.swift
//  M5_WrapChallenge
//
//  Created by tom montgomery on 2/2/23.
//

import SwiftUI



struct AllVideos: View {
    
    // pass the EO down from the app entry point
    //@EnvironmentObject var model: VideoModel
    // Switch to ObservedObject - TODO - why?
    @ObservedObject var model: VideoModel
    
    var body: some View {
        
            // Don't need a parent VStack with the Nav+List combo
            // NavigationView as we are listing out all the lessons
            NavigationView {
                // List - automatically a scrollview?
                List {
                    //Text(model.videos[0].title)
                    ForEach (model.videos) { video in
                        // each title is a NavLink.  pass in the video
                        NavigationLink(video.title,
                           destination: PlayerView(video: video))
                    }
                }
                // Nav title must be on the list.  Not visible on the NavView
                .navigationBarTitle(Text("All Videos"))
            }

    }
}

struct AllVideos_Previews: PreviewProvider {
    static var previews: some View {
        AllVideos(model: VideoModel())
        // make the
    }
}
