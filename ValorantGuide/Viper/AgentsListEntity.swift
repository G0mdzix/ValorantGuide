import Foundation

 struct AgentsListEntity: Codable {
     var data: [Agent]
 }
 
 struct Agent: Codable {
     let displayName: String
     let developerName: String
     let description: String
 }
