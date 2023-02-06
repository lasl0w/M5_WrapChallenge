//
//  VideoModel.swift
//  M5_WrapChallenge
//
//  Created by tom montgomery on 2/2/23.
//

import Foundation

class VideoModel : ObservableObject {
    
    // Initialize with an empty array of Videos
    @Published var videos = [Video]()
    
    var allVideos = [Video]()
    
    // init gets called any time we create an instance of VideoModel()
    // firstly/specifically when we create the .environmentObject in main
    init() {
        
        // Populate that videos array!
        getRemoteData()
    }
    
    func getRemoteData() {
        
        // Set URL
        let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        let url = URL(string: urlString)
        
        // protect against failure to create the URL object
        guard url != nil else {
            // couldn't create a URL, return nothing
            return
        }
        
        // ALT simplified syntax
        guard let altUrl = URL(string: "https://codewithchris.github.io/Module5Challenge/Data.json") else
            { return }
        
        // Create URLRequest - safely unwrap after guard
        let request = URLRequest(url: url!)
        
        // Start the session and kick off the task
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            // Define the completion handler here:
            
            // first check for errors
            guard error == nil else {
                // error! bail
                return
            }
            
            // Success! - handle the response
            do {
                // Create an instance of the JSONDecoder()
                let decoder = JSONDecoder()
                
                // parse the response
                let videos = try decoder.decode([Video].self, from: data!)
                
                // Append to the videos array - with a DispatchQueue
                DispatchQueue.main.async {
                    self.videos += videos
                }
            }
            catch {
                // couldn't parse the json
                print("Couldn't parse the json")
                print(error.localizedDescription)
                return
                
            }
        }
        dataTask.resume()
    }
}
