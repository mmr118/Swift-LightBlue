//
//  CBService+LightBlue.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 16/1/15.
//  Copyright © 2016年 Pluto-y. All rights reserved.
//

import CoreBluetooth

extension CBService {

    /// Obtain the name of the characteristic according to the UUID, if the UUID is the standard defined in the `Bluetooth Developer Portal` then return the name
    public var name: String {
        guard let kind = standardBTCBUUID else { return "0x" + self.uuid.uuidString }
        return kind.name
    }

    public var standardBTCBUUID: CharacteristicCBUUIDKind? { CharacteristicCBUUIDKind(rawValue: uuid.uuidString) }
    
}
