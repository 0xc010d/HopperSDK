//
//  SampleTool.swift
//  SampleTool
//
//  Created by Vincent Bénony on 26/04/2019.
//  Copyright © 2019 Cryptic Apps. All rights reserved.
//

import Foundation

class SwiftSampleTool : NSObject, HopperTool {
    var services: HPHopperServices!

    static func sdkVersion() -> Int32 {
        return HOPPER_CURRENT_SDK_VERSION
    }

    func pluginType() -> HopperPluginType {
        return .Plugin_Tool
    }
    
    func pluginUUID() -> NSObjectProtocol & HPHopperUUID {
        return services.uuid(with: "b2bbe202-3add-4f70-99c2-3682778bb078")
    }
    
    func pluginName() -> String {
        return "SampleTool (Swift)"
    }
    
    func pluginDescription() -> String {
        return "Sample Tool written in Swift"
    }
    
    func pluginAuthor() -> String {
        return "Vincent Bénony"
    }
    
    func pluginCopyright() -> String {
        return "© Cryptic Apps SARL"
    }
    
    func commandLineIdentifiers() -> [String] {
        return ["DummyTool"]
    }
    
    func pluginVersion() -> String {
        return "0.0.2"
    }

    required init(hopperServices services: NSObjectProtocol & HPHopperServices) {
        self.services = services
        super.init()
    }

    func toolMenuDescription() -> [[String : Any]] {
        return [
            [HPM_TITLE: "Sample Tool Fct1",
             HPM_SELECTOR: "fct1:"],

            [HPM_TITLE: "Sample Tool Menu",
             HPM_SUBMENU: [
                [HPM_TITLE: "Fct 2",
                 HPM_SELECTOR: "fct2:"],
                [HPM_TITLE: "Fct 3",
                 HPM_SELECTOR: "fct3:"
                ]
                ]
            ]
        ]
    }
    
    @objc func fct1(_ sender: AnyObject!) {
        if let doc = services.currentDocument() {
            doc.begin(toWait: "I'm waiting…")
            let msg = "Function1: address is \(String(format: "0x%llx", doc.currentAddress()))"
            doc.displayAlert(withMessageText: "Info",
                             defaultButton: "OK",
                             alternateButton: nil,
                             otherButton: nil,
                             informativeText: msg)
            doc.endWaiting()
        }
    }
    
    @objc func fct2(_ sender: AnyObject!) {
        if let doc = services.currentDocument() {
            doc.displayAlert(withMessageText: "Info",
                             defaultButton: "OK",
                             alternateButton: nil,
                             otherButton: nil,
                             informativeText: "Function 2 triggered")
        }
    }
    
    @objc func fct3(_ sender: AnyObject!) {
        if let doc = services.currentDocument() {
            doc.logStringMessage("Function 3 triggered")
        }
    }
}
