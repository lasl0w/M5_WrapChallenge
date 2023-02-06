//
//  PlayerView.swift
//  M5_WrapChallenge
//
//  Created by tom montgomery on 2/5/23.
//

import SwiftUI

struct PlayerView: View {
    
    var video: Video
    
    var body: some View {
        Text(video.url)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        // pass in a static single Video
        PlayerView(video: Video(id: 1, title: "Video Title", url: "https://codewithchris.github.io/Module5Challenge/Lesson%201.mp4"))
    }
}
