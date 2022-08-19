//
//  ValorantGuideUITestsLaunchTests.swift
//  ValorantGuideUITests
//
//  Created by Mateusz Gozdzik on 26/07/2022.
//

import XCTest

class ValorantGuideUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
  
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
