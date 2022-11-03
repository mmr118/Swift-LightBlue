//
//  VirtualPeripheral.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2018/12/27.
//  Copyright © 2018 Pluto-y. All rights reserved.
//

import CoreBluetooth

struct VirtualPeripheral: Codable {

    var name: String
    var uuid: UUID
    var services: [Service]

    func cbservices() -> [CBMutableService] {
        return []
    }
    
    static let blankPeripheral: VirtualPeripheral = {
        var characteristics: [Service.Characteristic] = []
        characteristics.append(Service.Characteristic(uuid: CBUUID(string: "2222"), properties: .read))
        return VirtualPeripheral(name: "Blank", uuid: UUID(), services: [Service(uuid: CBUUID(string: "1111"), primary: true, characteristics: characteristics)])
    }()
    
    static let alertNotificationPeripheral: VirtualPeripheral = {
        var characteristics: [Service.Characteristic] = []
        characteristics.append(Service.Characteristic(uuid: CharacteristicCBUUIDKind.supportedUnreadAlertCategory.cbuuid, properties: .read))
        characteristics.append(Service.Characteristic(uuid: CharacteristicCBUUIDKind.newAlert.cbuuid, properties: .notify))
        characteristics.append(Service.Characteristic(uuid: CharacteristicCBUUIDKind.alertNotificationControlPoint.cbuuid, properties: .write))
        characteristics.append(Service.Characteristic(uuid: CharacteristicCBUUIDKind.supportedNewAlertCategory.cbuuid, properties: .read))
        characteristics.append(Service.Characteristic(uuid: CharacteristicCBUUIDKind.unreadAlertStatus.cbuuid, properties: .notify))
        let services: [Service] = [
            Service(.alertNotification, primary: true, characteristics: characteristics)
        ]
        return VirtualPeripheral(name: "Alert Notification", uuid: UUID(), services: services)
    }()
    
    static let bloodPressurePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.hardwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.modelNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.IEEE11073_20601RegulatoryCertificationDataList, properties: .read))
        characteristics1.append(Service.Characteristic(.PnPID, properties: .read))
        characteristics1.append(Service.Characteristic(.softwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.serialNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.manufacturerNameString, properties: .read))
        characteristics1.append(Service.Characteristic(.firmwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.systemID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.intermediateCuffPressure, properties: .notify))
        characteristics2.append(Service.Characteristic(.bloodPressureMeasurement, properties: .indicate))
        characteristics2.append(Service.Characteristic(.bloodPressureFeature, properties: .read))
        let services: [Service] = [
            Service(.deviceInformation, primary: true, characteristics: characteristics1),
            Service(.bloodPressure, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Blood Pressure", uuid: UUID(), services: services)
    }()
    
    static let cyclingPowerPeripheral: VirtualPeripheral = {
        var characteristics: [Service.Characteristic] = []
        characteristics.append(Service.Characteristic(.cyclingPowerFeature, properties: .read))
        characteristics.append(Service.Characteristic(.cyclingPowerMeasurement, properties: .notify))
        characteristics.append(Service.Characteristic(.sensorLocation, properties: .read))
        characteristics.append(Service.Characteristic(.cyclingPowerControlPoint, properties: [.write, .indicate]))
        characteristics.append(Service.Characteristic(.cyclingPowerVector, properties: .notify))
        let services: [Service] = [
            Service(.cyclingPower, primary: true, characteristics: characteristics),
        ]
        return VirtualPeripheral(name: "Cycling Power", uuid: UUID(), services: services)
    }()
    
    static let cyclingSpeedAndCadencePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.hardwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.modelNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.IEEE11073_20601RegulatoryCertificationDataList, properties: .read))
        characteristics1.append(Service.Characteristic(.PnPID, properties: .read))
        characteristics1.append(Service.Characteristic(.softwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.serialNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.manufacturerNameString, properties: .read))
        characteristics1.append(Service.Characteristic(.firmwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.systemID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.CSCFeature, properties: .read))
        characteristics2.append(Service.Characteristic(.sensorLocation, properties: .read))
        characteristics2.append(Service.Characteristic(.CSCMeasurement, properties: .notify))
        characteristics2.append(Service.Characteristic(.SCControlPoint, properties: [.write, .indicate]))
        let services = [
            Service(.deviceInformation, primary: true, characteristics: characteristics1),
            Service(.cyclingSpeedAndCadence, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Cycling Speed and Cadence", uuid: UUID(), services: services)
    }()
    
    static let findMePeripheral: VirtualPeripheral = {
        var characteristics: [Service.Characteristic] = []
        characteristics.append(Service.Characteristic(.alertLevel, properties: []))
        let services = [
            Service(.immediateAlert, primary: true, characteristics: characteristics),
        ]
        return VirtualPeripheral(name: "Find Me", uuid: UUID(), services: services)
    }()
    
    static let glucosePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.glucoseMeasurementContext, properties: .notify))
        characteristics1.append(Service.Characteristic(.glucoseFeature, properties: .read))
        characteristics1.append(Service.Characteristic(.glucoseMeasurement, properties: .notify))
        characteristics1.append(Service.Characteristic(.recordAccessControlPoint, properties: [.write, .indicate]))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.hardwareRevisionString, properties: .read))
        characteristics2.append(Service.Characteristic(.modelNumberString, properties: .read))
        characteristics2.append(Service.Characteristic(.IEEE11073_20601RegulatoryCertificationDataList, properties: .read))
        characteristics2.append(Service.Characteristic(.PnPID, properties: .read))
        characteristics2.append(Service.Characteristic(.softwareRevisionString, properties: .read))
        characteristics2.append(Service.Characteristic(.serialNumberString, properties: .read))
        characteristics2.append(Service.Characteristic(.manufacturerNameString, properties: .read))
        characteristics2.append(Service.Characteristic(.firmwareRevisionString, properties: .read))
        characteristics2.append(Service.Characteristic(.systemID, properties: .read))
        let services = [
            Service(.glucose, primary: true, characteristics: characteristics1),
            Service(.deviceInformation, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Glucose", uuid: UUID(), services: services)
    }()
    
    static let HIDOVERGATTPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.report, properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(.HIDInformation, properties: .read))
        characteristics1.append(Service.Characteristic(.bootKeyboardInputReport, properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(.bootKeyboardOutputReport, properties: [.read, .write]))
        characteristics1.append(Service.Characteristic(.reportMap, properties: .read))
        characteristics1.append(Service.Characteristic(.protocolMode, properties: .read))
        characteristics1.append(Service.Characteristic(.bootMouseInputReport, properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(.HIDControlPoint, properties: []))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.hardwareRevisionString, properties: .read))
        characteristics2.append(Service.Characteristic(.modelNumberString, properties: .read))
        characteristics2.append(Service.Characteristic(.IEEE11073_20601RegulatoryCertificationDataList, properties: .read))
        characteristics2.append(Service.Characteristic(.PnPID, properties: .read))
        characteristics2.append(Service.Characteristic(.softwareRevisionString, properties: .read))
        characteristics2.append(Service.Characteristic(.serialNumberString, properties: .read))
        characteristics2.append(Service.Characteristic(.manufacturerNameString, properties: .read))
        characteristics2.append(Service.Characteristic(.firmwareRevisionString, properties: .read))
        characteristics2.append(Service.Characteristic(.systemID, properties: .read))
        var characteristics3: [Service.Characteristic] = []
        characteristics3.append(Service.Characteristic(.batteryLevel, properties: .read))
        var characteristics4: [Service.Characteristic] = []
        characteristics4.append(Service.Characteristic(.scanIntervalWindow, properties: []))
        characteristics4.append(Service.Characteristic(.scanRefresh, properties: .notify))
        let services = [
            Service(.humanInterfaceDevice, primary: true, characteristics: characteristics1),
            Service(.deviceInformation, primary: true, characteristics: characteristics2),
            Service(.batterService, primary: true, characteristics: characteristics3),
            Service(.scanParameters, primary: true, characteristics: characteristics4),
        ]
        return VirtualPeripheral(name: "HID OVER GATT", uuid: UUID(), services: services)
    }()
    
    static let healthThermometerPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.hardwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.modelNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.IEEE11073_20601RegulatoryCertificationDataList, properties: .read))
        characteristics1.append(Service.Characteristic(.PnPID, properties: .read))
        characteristics1.append(Service.Characteristic(.softwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.serialNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.manufacturerNameString, properties: .read))
        characteristics1.append(Service.Characteristic(.firmwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.systemID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.intermediateTemperature, properties: .notify))
        characteristics2.append(Service.Characteristic(.temperatureMeasurement, properties: .indicate))
        characteristics2.append(Service.Characteristic(.temperatureType, properties: .read))
        characteristics2.append(Service.Characteristic(.measurementInterval, properties: .read))
        let services = [
            Service(.deviceInformation, primary: true, characteristics: characteristics1),
            Service(.healthThermometer, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Health Thermometer", uuid: UUID(), services: services)
    }()
    
    static let heartRatePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.hardwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.modelNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.IEEE11073_20601RegulatoryCertificationDataList, properties: .read))
        characteristics1.append(Service.Characteristic(.PnPID, properties: .read))
        characteristics1.append(Service.Characteristic(.softwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.serialNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.manufacturerNameString, properties: .read))
        characteristics1.append(Service.Characteristic(.firmwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.systemID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.heartRateControlPoint, properties: .write))
        characteristics2.append(Service.Characteristic(.bodySensorLocation, properties: .read))
        characteristics2.append(Service.Characteristic(.heartRateMeasurement, properties: .notify))
        let services = [
            Service(.deviceInformation, primary: true, characteristics: characteristics1),
            Service(.heartRate, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Heart Rate", uuid: UUID(), services: services)
    }()
    
    static let locationAndNavigationPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.LNFeature, properties: .read))
        characteristics1.append(Service.Characteristic(.navigation, properties: .notify))
        characteristics1.append(Service.Characteristic(.LNControlPoint, properties: [.write, .indicate]))
        characteristics1.append(Service.Characteristic(.positionQuality, properties: .read))
        characteristics1.append(Service.Characteristic(.locationAndSpeed, properties: .notify))
        let services = [
            Service(.locationAndNavigation, primary: true, characteristics: characteristics1),
        ]
        return VirtualPeripheral(name: "Location and Navigation", uuid: UUID(), services: services)
    }()
    
    static let phoneAlertStatusPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.ringerSetting, properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(.ringerControlPoint, properties: []))
        characteristics1.append(Service.Characteristic(.alertStatus, properties: [.read, .notify]))
        let services = [
            Service(.phoneAlertStatusService, primary: true, characteristics: characteristics1),
        ]
        return VirtualPeripheral(name: "Phone Alert Status", uuid: UUID(), services: services)
    }()
    
    static let polarHRSensorPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.hardwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.modelNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.IEEE11073_20601RegulatoryCertificationDataList, properties: .read))
        characteristics1.append(Service.Characteristic(.PnPID, properties: .read))
        characteristics1.append(Service.Characteristic(.softwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.serialNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.manufacturerNameString, properties: .read))
        characteristics1.append(Service.Characteristic(.firmwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.systemID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.batteryLevel, properties: .read))
        var characteristics3: [Service.Characteristic] = []
        characteristics3.append(Service.Characteristic(.bodySensorLocation, properties: .read))
        characteristics3.append(Service.Characteristic(.heartRateMeasurement, properties: .notify))
        var characteristics4: [Service.Characteristic] = []
        characteristics4.append(Service.Characteristic(uuid: CBUUID(string: "6217FF4A-B07D-5DEB-261E-2586752D942E"), properties: [.read, .write]))
        let services = [
            Service(.deviceInformation, primary: true, characteristics: characteristics1),
            Service(.batterService, primary: true, characteristics: characteristics2),
            Service(.heartRate, primary: true, characteristics: characteristics3),
            Service(uuid: CBUUID(string: "6217FF49-AC7B-547E-EECF-016A06970BA9"), primary: true, characteristics: characteristics4),
        ]
        return VirtualPeripheral(name: "Polar HR Sensor", uuid: UUID(), services: services)
    }()
    
    static let proximityPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.alertLevel, properties: [.read, .write]))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.txPowerLevel, properties: .read))
        var characteristics3: [Service.Characteristic] = []
        characteristics3.append(Service.Characteristic(.alertLevel, properties: []))
        let services = [
            Service(.linkLoss, primary: true, characteristics: characteristics1),
            Service(.txPower, primary: true, characteristics: characteristics2),
            Service(.immediateAlert, primary: true, characteristics: characteristics3),
        ]
        return VirtualPeripheral(name: "Proximity", uuid: UUID(), services: services)
    }()
    
    static let runningSpeedAndCadencePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.hardwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.modelNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.IEEE11073_20601RegulatoryCertificationDataList, properties: .read))
        characteristics1.append(Service.Characteristic(.PnPID, properties: .read))
        characteristics1.append(Service.Characteristic(.softwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.serialNumberString, properties: .read))
        characteristics1.append(Service.Characteristic(.manufacturerNameString, properties: .read))
        characteristics1.append(Service.Characteristic(.firmwareRevisionString, properties: .read))
        characteristics1.append(Service.Characteristic(.systemID, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.RSCMeasurement, properties: .notify))
        characteristics2.append(Service.Characteristic(.sensorLocation, properties: .read))
        characteristics2.append(Service.Characteristic(.RSCFeature, properties: .read))
        characteristics2.append(Service.Characteristic(.SCControlPoint, properties: [.write, .indicate]))
        let services = [
            Service(.deviceInformation, primary: true, characteristics: characteristics1),
            Service(.runningSpeedAndCadence, primary: true, characteristics: characteristics2),
        ]
        return VirtualPeripheral(name: "Polar HR Sensor", uuid: UUID(), services: services)
    }()
    
    static let scanParametersPeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.scanIntervalWindow, properties: []))
        characteristics1.append(Service.Characteristic(.scanRefresh, properties: .notify))
        let services = [
            Service(.scanParameters, primary: true, characteristics: characteristics1),
        ]
        return VirtualPeripheral(name: "Scan Parameters", uuid: UUID(), services: services)
    }()
    
    static let temperatureAlarmServicePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(uuid: CBUUID(string: "CCCCFFFF-DEAD-F154-1319-740381000000"), properties: [.read, .notify]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID(string: "AAAAAAAA-DEAD-F154-1319-740381000000"), properties: .notify))
        characteristics1.append(Service.Characteristic(uuid: CBUUID(string: "EDEDEDED-DEAD-F154-1319-740381000000"), properties: [.read, .write]))
        characteristics1.append(Service.Characteristic(uuid: CBUUID(string: "C0C0C0C0-DEAD-F154-1319-740381000000"), properties: [.read, .write]))
        let services = [
            Service(uuid: CBUUID(string: "DEADF154-0000-0000-0000-0000DEADF154"), primary: true, characteristics: characteristics1),
        ]
        return VirtualPeripheral(name: "Temperature Alarm Service", uuid: UUID(), services: services)
    }()
    
    static let timePeripheral: VirtualPeripheral = {
        var characteristics1: [Service.Characteristic] = []
        characteristics1.append(Service.Characteristic(.timeWithDST, properties: .read))
        var characteristics2: [Service.Characteristic] = []
        characteristics2.append(Service.Characteristic(.referenceTimeInformation, properties: .read))
        characteristics2.append(Service.Characteristic(.currentTime, properties: [.read, .notify]))
        characteristics2.append(Service.Characteristic(.localTimeInformation, properties: .read))
        var characteristics3: [Service.Characteristic] = []
        characteristics3.append(Service.Characteristic(.timeUpdateState, properties: .read))
        characteristics3.append(Service.Characteristic(.timeUpdateControlPoint, properties: []))
        let services = [
            Service(.nextDSTChangeService, primary: true, characteristics: characteristics1),
            Service(.currentTimeService, primary: true, characteristics: characteristics2),
            Service(.referenceTimeUpdateService, primary: true, characteristics: characteristics3),
        ]
        return VirtualPeripheral(name: "Time", uuid: UUID(), services: services)
    }()
}


// MARK: - Service
extension VirtualPeripheral {

    struct Service: Codable {

        var uuidString: String
        let primary: Bool
        var characteristics: [Characteristic]
        var cbService: CBService {
            let result = CBMutableService(type: CBUUID(string: uuidString), primary: primary)
            result.characteristics = characteristics.map(\.cbCharacteristic)
            return result
        }

        var standardKind: ServiceCBUUIDKind?

        init(uuid: CBUUID, primary: Bool, characteristics: [Characteristic]) {
            self.uuidString = uuid.uuidString
            self.primary = primary
            self.characteristics = characteristics
        }

        init(_ kind: ServiceCBUUIDKind, primary: Bool, characteristics: [Characteristic]) {
            self.init(uuid: kind.cbuuid, primary: primary, characteristics: characteristics)
            self.standardKind = kind
        }

    }
}


// MARK: - Characteristic
extension VirtualPeripheral.Service {

    struct Characteristic: Codable {
        var uuidString: String
        var properties: Properties
        var userDescription: String?
        var value: Data?
        var cbCharacteristic: CBCharacteristic { CBMutableCharacteristic(type: CBUUID(string: uuidString), properties: properties.cbProperties, value: nil, permissions: []) }

        var standardKind: CharacteristicCBUUIDKind?


        init(uuid: CBUUID, properties: Properties) {
            self.uuidString = uuid.uuidString
            self.properties = properties
        }

        init(_ kind: CharacteristicCBUUIDKind, properties: Properties) {
            self.init(uuid: kind.cbuuid, properties: properties)
            self.standardKind = kind
        }

    }

}


// MARK: - Properties
extension VirtualPeripheral.Service.Characteristic {

    struct Properties: OptionSet, Codable {

        let rawValue: Int

        static let broadcast                    = Properties(rawValue: 1 << 0)
        static let read                         = Properties(rawValue: 1 << 1)
        static let writeWithoutResponse         = Properties(rawValue: 1 << 2)
        static let write                        = Properties(rawValue: 1 << 3)
        static let notify                       = Properties(rawValue: 1 << 4)
        static let indicate                     = Properties(rawValue: 1 << 5)
        static let authenticatedSignedWrites    = Properties(rawValue: 1 << 6)
        static let extendedProperties           = Properties(rawValue: 1 << 7)
        static let notifyEncryptionRequired     = Properties(rawValue: 1 << 8)
        static let indicateEncryptionRequired   = Properties(rawValue: 1 << 9)

        var names: [String] { return cbProperties.names }

        var cbProperties: CBCharacteristicProperties {
            var result: CBCharacteristicProperties = []

            if contains(.broadcast) {
                result.formUnion(.broadcast)
            }
            if contains(.read) {
                result.formUnion(.read)
            }
            if contains(.writeWithoutResponse) {
                result.formUnion(.writeWithoutResponse)
            }
            if contains(.write) {
                result.formUnion(.write)
            }
            if contains(.notify) {
                result.formUnion(.notify)
            }
            if contains(.indicate) {
                result.formUnion(.indicate)
            }
            if contains(.authenticatedSignedWrites) {
                result.formUnion(.authenticatedSignedWrites)
            }
            if contains(.extendedProperties) {
                result.formUnion(.extendedProperties)
            }
            if contains(.notifyEncryptionRequired) {
                result.formUnion(.notifyEncryptionRequired)
            }
            if contains(.indicateEncryptionRequired) {
                result.formUnion(.indicateEncryptionRequired)
            }
            return result
        }

    }

}

// MARKL - VirtualPeripheral: Equatable
extension VirtualPeripheral: Equatable {
    static func == (lhs: VirtualPeripheral, rhs: VirtualPeripheral) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
