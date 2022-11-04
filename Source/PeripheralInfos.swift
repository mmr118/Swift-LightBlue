//
//  PeripheralInfos.swift
//  SwiftUI-LightBlue
//
//  Created by Rondon Monica on 04.11.22.
//  Copyright © 2022 Pluto-y. All rights reserved.
//

import Foundation
import CoreBluetooth

class PeripheralInfos: NSObject, ObservableObject {
    let peripheral: CBPeripheral
    var RSSI: Int = 0
    var advertisementData: [String: Any] = [:]
    var lastUpdatedTimeInterval: TimeInterval

    init(_ peripheral: CBPeripheral) {
        self.peripheral = peripheral
        self.lastUpdatedTimeInterval = Date().timeIntervalSince1970
    }

    static func == (lhs: PeripheralInfos, rhs: PeripheralInfos) -> Bool {
        return lhs.peripheral.isEqual(rhs.peripheral)
    }

}
