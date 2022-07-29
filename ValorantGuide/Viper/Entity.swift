//
//  Entity.swift
//  ValorantGuide
//
//  Created by Mateusz Gozdzik on 29/07/2022.
//

import Foundation

 struct User: Codable {
     let name: String
 }
 


/*
 struct User: Codable {
     var data: [Agent]
 }
 
 struct Agent: Codable {
     let displayName: String
 }

 */

/*
 struct AgentList: Codable {
     var data: [Agent]?
 }
*/

/*
 struct StationsList: Codable {
     var features: [Station]
 }

 struct StationDetails: Codable{
     let label, bikes, free_racks: String
 }

 struct StationGeometry: Codable{
     let coordinates: Array<Double>
 }

 struct Station: Codable{
     let geometry: StationGeometry
     let properties: StationDetails
 }


 */
