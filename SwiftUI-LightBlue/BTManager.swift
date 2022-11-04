//
//  BTManager.swift
//  SwiftUI-LightBlue
//
//  Created by Rondon Monica on 04.11.22.
//  Copyright © 2022 Pluto-y. All rights reserved.
//

import Foundation
import CoreBluetooth

class BTManager: NSObject, ObservableObject {

    var manager: BluetoothManager { .shared }

    var preferences: Preferences? { PreferencesStore.shared.preferences }

    @Published var peripheral = [CBPeripheral]()

    @Published var nearbyPeripheralInfos: [PeripheralInfos] = []

    override init() {
        super.init()
        manager.delegate = self
    }

    private func updateExisitingPreference(_ peripheral: CBPeripheral, advertData: [String: Any], RSSI: NSNumber) {
        let peripheralInfo = PeripheralInfos(peripheral)

        guard let index = nearbyPeripheralInfos.firstIndex(of: peripheralInfo) else { return }

        let originPeripheralInfo = nearbyPeripheralInfos[index]
        let nowTimeInterval = Date().timeIntervalSince1970

        // If the last update within one second, then ignore it
        guard nowTimeInterval - originPeripheralInfo.lastUpdatedTimeInterval >= 1.0 else { return }
        originPeripheralInfo.lastUpdatedTimeInterval = nowTimeInterval
        originPeripheralInfo.RSSI = RSSI.intValue
        originPeripheralInfo.advertisementData = advertData
    }

    private func storeNewPeripheral(_ peripheral: CBPeripheral, advertData: [String: Any], RSSI: NSNumber) {
        let peripheralInfo = PeripheralInfos(peripheral)

        if let preference = preferences, preference.needFilter {
            if RSSI.intValue != 127, RSSI.intValue > preference.filter {
                peripheralInfo.RSSI = RSSI.intValue
                peripheralInfo.advertisementData = advertData
                nearbyPeripheralInfos.append(peripheralInfo)
                LogStore.append("Discovered nearby peripheral: \(peripheral.name ?? "(null)") (RSSI: \(RSSI.intValue))")
            }

        } else {
            peripheralInfo.RSSI = RSSI.intValue
            peripheralInfo.advertisementData = advertData
            nearbyPeripheralInfos.append(peripheralInfo)
            LogStore.append("Discovered nearby peripheral: \(peripheral.name ?? "(null)")) (RSSI: \(RSSI.intValue))")
        }
    }
}


extension BTManager: BluetoothDelegate {

    @objc func didUpdateState(_ state: CBManagerState) {

        if state == .poweredOn {
            manager.startScanPeripheral()
        }

    }

    @objc func didDiscoverPeripheral(_ peripheral: CBPeripheral, advertisementData: [String : Any], RSSI: NSNumber) {

        let peripheralInfo = PeripheralInfos(peripheral)

        if !nearbyPeripheralInfos.contains(peripheralInfo) {
            storeNewPeripheral(peripheral, advertData: advertisementData, RSSI: RSSI)
        } else {
            updateExisitingPreference(peripheral, advertData: advertisementData, RSSI: RSSI)
        }

    }

    @objc func didConnectedPeripheral(_ connectedPeripheral: CBPeripheral) {

    }

    @objc func failToConnectPeripheral(_ peripheral: CBPeripheral, error: Error) {

    }

    @objc func didDiscoverServices(_ peripheral: CBPeripheral) {

    }

    @objc func didDisconnectPeripheral(_ peripheral: CBPeripheral) {

    }

    @objc func didFailedToInterrogate(_ peripheral: CBPeripheral) {

    }

    @objc func didDiscoverCharacteritics(_ service: CBService) {

    }

    @objc func didFailToDiscoverCharacteritics(_ error: Error) {

    }

    @objc func didDiscoverDescriptors(_ characteristic: CBCharacteristic) {

    }

    @objc func didFailToDiscoverDescriptors(_ error: Error) {

    }

    @objc func didReadValueForCharacteristic(_ characteristic: CBCharacteristic) {

    }

    @objc func didFailToReadValueForCharacteristic(_ error: Error) {

    }

}
