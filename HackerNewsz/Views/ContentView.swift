//
//  ContentView.swift
//  HackerNewsz
//
//  Created by Consultant on 1/8/23.
//

import SwiftUI

struct ContentView: View {
// This signifies this will be listening from our network manager class - sunscrining to updates from network manager
    @ObservedObject var networkManager = NetworkManager()
    
    
    // view loads up
    var body: some View {
        // NavigationView allows us to get back and forth from pages
        NavigationView{
            /* To make a list, wrap the items/content in the list component
             This is making it so we can accept our array of movie listings -- listing array
             be accpeted in so we dont have to create TEXT for each movie*/
            List(networkManager.posts) {
                post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                }
              
                }
            }
            
            // add title to nagivation view
            .navigationTitle("Truth News")
        }
// onAppear shows what will happen when the view appears on the screen
        .onAppear {
//tapping Network manage to run fetchData
            
            self.networkManager.fetchData()
        }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

// Creating this to avoid having to type out each movie title
struct MovieListing: Identifiable {
    let id: String
    let title: String
    
}

/*
 let posts = [
 
 MovieListing(id: "1", title: "Today"),
 MovieListing(id: "2", title: "Today"),
 MovieListing(id: "3", title: "Today"),
 MovieListing(id: "4", title: "Today"),
 
 
 ]
 */
