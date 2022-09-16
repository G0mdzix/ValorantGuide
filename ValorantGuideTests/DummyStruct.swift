import XCTest
@testable import ValorantGuide

struct DummyAgents {
  static let agents = [Agent(displayName: "Adam",
                             developerName: "FirstHuman",
                             description: "Nil",
                             displayIconSmall: "Nil",
                             role: role[0],
                             abilities: agentAbilities),
                       Agent(displayName: "Eve",
                             developerName: "SecondHuman",
                             description: "None",
                             displayIconSmall: "Nil",
                             role: role[1],
                             abilities: agentAbilities),
                       Agent(displayName: "Eve",
                             developerName: "SecondHuman",
                             description: "None",
                             displayIconSmall: "Nil",
                             role: role[1],
                             abilities: agentAbilities),
                       Agent(displayName: "Zeke",
                             developerName: "FirstOrc",
                             description: "Nil",
                             displayIconSmall: "Nil",
                             role: nil,
                             abilities: agentAbilities)]

  static let agentAbilities = [AgentAbilities(displayIcon: "nil",
                                              displayName: "FirstPhoto",
                                              description: "nill descipriton"),
                               AgentAbilities(displayIcon: "None",
                                              displayName: "SecondPhoto",
                                              description: "abc"),
                               AgentAbilities(displayIcon: "Icon",
                                              displayName: "FirstShoter",
                                              description: "zxc")]

  static let role = [AgentRole(displayName: "Human"),
                     AgentRole(displayName: "Elf")]
}
