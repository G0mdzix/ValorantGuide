import Foundation

struct AgentsListEntity: Codable, Hashable {
  var data: [Agent]
}

struct Agent: Codable, Hashable {
  let displayName: String
  let developerName: String
  let description: String
  let displayIconSmall: String
  let role: AgentRole? // Musi tak byc poniewaz jeden z agentow w api nie ma roli !!!!!!!!!!!!!!!!!!!!!!!
  let abilities: [AgentAbilities]
}

struct AgentAbilities: Codable, Hashable {
  let displayIcon: String?
  let displayName: String
  let description: String
}

struct AgentRole: Codable, Hashable {
  let displayName: String
}
