import Foundation

 struct AgentsListEntity: Codable {
     var data: [Agent]
 }
 
 struct Agent: Codable {
     let displayName: String
     let developerName: String
     let description: String
     let displayIconSmall: String
     let abilities: [AgentAbilities]
 }

struct AgentAbilities: Codable {
    let slot: String
    let displayName: String
    let description: String
  //  let displayIcon: String  // Cos tutaj nie działa !!!!!!!!
}
