/* A Model/Struct is needed to handle our results and let JSON decode the Data
 This Model must have the DECODABLE Protocol
 
 
 */

import Foundation
struct Results: Decodable {
    let hits: [Post]
}


struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
   
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
   
    
}
