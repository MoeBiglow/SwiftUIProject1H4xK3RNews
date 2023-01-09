//
//  NetWorkManager.swift
//  Movie DataBase
//
//  Created by Consultant on 1/8/23.
//

import Foundation
             // protocol conforms to Observable Object & makes the NetWork manager class observable with updates
class NetworkManager: ObservableObject {
    
// creating @Published for whoever is subscribed/listening  -- this created an object called posts that is an array of Post objects this stores the API results
@Published var posts = [Post]()
    
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
// the JSON decoder decodes the data we get back from our network session
                    let decoder = JSONDecoder()
                    
                    // once we get data back then decode the data
                    if let safeData = data {
                        do {
                      let results =  try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            
                            print(error)
                        }
                        
                    }
                    
                }
   
            }
            
            task.resume()
            
        }
        
    }}
