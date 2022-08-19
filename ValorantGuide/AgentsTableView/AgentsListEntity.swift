import Foundation

struct AgentsListEntity: Codable {
  var data: [Agent]
}

struct Agent: Codable {
  let displayName: String
  let developerName: String
  let description: String
  let displayIconSmall: String
  let role: AgentRole?
  let abilities: [AgentAbilities]
  }

struct AgentAbilities: Codable {
  let displayIcon: String?
  let displayName: String
  let description: String
}

struct AgentRole: Codable {
  let displayName: String
}
