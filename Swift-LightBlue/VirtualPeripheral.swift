//
//  VirtualPeripheral.swift
//  Swift-LightBlue
//
//  Created by Longhua Zhang on 2018/12/27.
//  Copyright © 2018 Pluto-y. All rights reserved.
//

import CoreBluetooth

struct VirtualPeripheral {
    let name: String
    let uuid: CBUUID
    var services: [CBMutableService]
    
    init(_ name: String, uuid: CBUUID, services: [CBMutableService]) {
        self.name = name
        self.uuid = uuid
        self.services = services
    }
    
    static let blankPeripheral: VirtualPeripheral = {
        let service = CBMutableService(type: CBUUID(string: "1111"), primary: true)
        var characteristics: [CBCharacteristic] = []
        characteristics.append(CBMutableCharacteristic(type: CBUUID(string: "2222"), properties: .read, value: nil, permissions: []))
        service.characteristics = characteristics
        return VirtualPeripheral("Blank", uuid: CBUUID(), services: [service])
    }()
    
    static let alertNotificationPeripheral: VirtualPeripheral = {
        let service = CBMutableService(type: CBUUID.alertNotificationUUID, primary: true)
        var characteristics: [CBCharacteristic] = []
        characteristics.append(CBMutableCharacteristic(type: CBUUID.supportedUnreadAlertCategoryUUID, properties: .read, value: nil, permissions: []))
        characteristics.append(CBMutableCharacteristic(type: CBUUID.newAlertUUID, properties: .notify, value: nil, permissions: []))
        characteristics.append(CBMutableCharacteristic(type: CBUUID.alertNotificationControlPointUUID, properties: .write, value: nil, permissions: []))
        characteristics.append(CBMutableCharacteristic(type: CBUUID.supportedNewAlertCategoryUUID, properties: .read, value: nil, permissions: []))
        characteristics.append(CBMutableCharacteristic(type: CBUUID.unreadAlertStatusUUID, properties: .notify, value: nil, permissions: []))
        service.characteristics = characteristics
        return VirtualPeripheral("Alert Notification", uuid: CBUUID(), services: [service])
    }()
    
    static let bloodPressurePeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.deviceInformationUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.hardwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.modelNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.PnPIDUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.softwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.serialNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.manufacturerNameStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.firmwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.systemIDUUID, properties: .read, value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.bloodPressureUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.intermediateCuffPressureUUID, properties: .notify, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.bloodPressureMeasurementUUID, properties: .indicate, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.bloodPressureFeatureUUID, properties: .read, value: nil, permissions: []))
        service2.characteristics = characteristics2
        return VirtualPeripheral("Blood Pressure", uuid: CBUUID(), services: [service1, service2])
    }()
    
    static let cyclingPowerPeripheral: VirtualPeripheral = {
        let service = CBMutableService(type: CBUUID.cyclingPowerUUID, primary: true)
        var characteristics: [CBCharacteristic] = []
        characteristics.append(CBMutableCharacteristic(type: CBUUID.cyclingPowerFeatureUUID, properties: .read, value: nil, permissions: []))
        characteristics.append(CBMutableCharacteristic(type: CBUUID.cyclingPowerMeasurementUUID, properties: .notify, value: nil, permissions: []))
        characteristics.append(CBMutableCharacteristic(type: CBUUID.sensorLocationUUID, properties: .read, value: nil, permissions: []))
        characteristics.append(CBMutableCharacteristic(type: CBUUID.cyclingPowerControlPointUUID, properties: [.write, .indicate], value: nil, permissions: []))
        characteristics.append(CBMutableCharacteristic(type: CBUUID.cyclingPowerVectorUUID, properties: .notify, value: nil, permissions: []))
        service.characteristics = characteristics
        return VirtualPeripheral("Cycling Power", uuid: CBUUID(), services: [service])
    }()
    
    static let cyclingSpeedAndCadencePeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.deviceInformationUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.hardwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.modelNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.PnPIDUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.softwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.serialNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.manufacturerNameStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.firmwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.systemIDUUID, properties: .read, value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.cyclingSpeedAndCadenceUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.CSCFeatureUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.sensorLocationUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.CSCMeasurementUUID, properties: .notify, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.SCControlPointUUID, properties: [.write, .indicate], value: nil, permissions: []))
        service2.characteristics = characteristics2
        return VirtualPeripheral("Cycling Speed and Cadence", uuid: CBUUID(), services: [service1, service2])
    }()
    
    static let findMePeripheral: VirtualPeripheral = {
        let service = CBMutableService(type: CBUUID.immediateAlertUUID, primary: true)
        var characteristics: [CBCharacteristic] = []
        characteristics.append(CBMutableCharacteristic(type: CBUUID.alertLevelUUID, properties: [], value: nil, permissions: []))
        service.characteristics = characteristics
        return VirtualPeripheral("Find Me", uuid: CBUUID(), services: [service])
    }()
    
    static let glucosePeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.glucoseUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.glucoseMeasurementContextUUID, properties: .notify, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.glucoseFeatureUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.glucoseMeasurementUUID, properties: .notify, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.recordAccessControlPointUUID, properties: [.write, .indicate], value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.deviceInformationUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.hardwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.modelNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.PnPIDUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.softwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.serialNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.manufacturerNameStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.firmwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.systemIDUUID, properties: .read, value: nil, permissions: []))
        service2.characteristics = characteristics2
        return VirtualPeripheral("Glucose", uuid: CBUUID(), services: [service1, service2])
    }()
    
    static let HIDOVERGATTPeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.humanInterfaceDeviceUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.reportUUID, properties: [.read, .notify], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.HIDInformationUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.bootKeyboardInputReportUUID, properties: [.read, .notify], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.bootKeyboardOutputReportUUID, properties: [.read, .write], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.reportMapUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.protocolModeUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.bootMouseInputReportUUID, properties: [.read, .notify], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.HIDControlPointUUID, properties: [], value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.deviceInformationUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.hardwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.modelNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.PnPIDUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.softwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.serialNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.manufacturerNameStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.firmwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.systemIDUUID, properties: .read, value: nil, permissions: []))
        service2.characteristics = characteristics2
        let service3 = CBMutableService(type: CBUUID.batterServiceUUID, primary: true)
        var characteristics3: [CBCharacteristic] = []
        characteristics3.append(CBMutableCharacteristic(type: CBUUID.batteryLevelUUID, properties: .read, value: nil, permissions: []))
        service3.characteristics = characteristics3
        let service4 = CBMutableService(type: CBUUID.scanParametersUUID, primary: true)
        var characteristics4: [CBCharacteristic] = []
        characteristics4.append(CBMutableCharacteristic(type: CBUUID.scanIntervalWindowUUID, properties: [], value: nil, permissions: []))
        characteristics4.append(CBMutableCharacteristic(type: CBUUID.scanRefreshUUID, properties: .notify, value: nil, permissions: []))
        service4.characteristics = characteristics4
        return VirtualPeripheral("HID OVER GATT", uuid: CBUUID(), services: [service1, service2, service3, service4])
    }()
    
    static let healthThermometerPeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.deviceInformationUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.hardwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.modelNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.PnPIDUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.softwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.serialNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.manufacturerNameStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.firmwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.systemIDUUID, properties: .read, value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.healthThermometerUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.intermediateTemperatureUUID, properties: .notify, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.temperatureMeasurementUUID, properties: .indicate, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.temperatureTypeUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.measurementIntervalUUID, properties: .read, value: nil, permissions: []))
        service2.characteristics = characteristics2
        return VirtualPeripheral("Health Thermometer", uuid: CBUUID(), services: [service1, service2])
    }()
    
    static let heartRatePeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.deviceInformationUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.hardwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.modelNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.PnPIDUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.softwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.serialNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.manufacturerNameStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.firmwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.systemIDUUID, properties: .read, value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.heartRateUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.heartRateControlPointUUID, properties: .write, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.bodySensorLocationUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.heartRateMeasurementUUID, properties: .notify, value: nil, permissions: []))
        service2.characteristics = characteristics2
        return VirtualPeripheral("Heart Rate", uuid: CBUUID(), services: [service1, service2])
    }()
    
    static let locationAndNavigationPeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.locationAndNavigationUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.LNFeatureUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.navigationUUID, properties: .notify, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.LNControlPointUUID, properties: [.write, .indicate], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.positionQualityUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.locationAndSpeedUUID, properties: .notify, value: nil, permissions: []))
        service1.characteristics = characteristics1
        return VirtualPeripheral("Location and Navigation", uuid: CBUUID(), services: [service1])
    }()
    
    static let phoneAlertStatusPeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.phoneAlertStatusServiceUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.ringerSettingUUID, properties: [.read, .notify], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.ringerControlPointUUID, properties: [], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.alertStatusUUID, properties: [.read, .notify], value: nil, permissions: []))
        service1.characteristics = characteristics1
        return VirtualPeripheral("Phone Alert Status", uuid: CBUUID(), services: [service1])
    }()
    
    static let polarHRSensorPeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.deviceInformationUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.hardwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.modelNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.PnPIDUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.softwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.serialNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.manufacturerNameStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.firmwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.systemIDUUID, properties: .read, value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.deviceInformationUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.batteryLevelUUID, properties: .read, value: nil, permissions: []))
        service2.characteristics = characteristics2
        let service3 = CBMutableService(type: CBUUID.heartRateUUID, primary: true)
        var characteristics3: [CBCharacteristic] = []
        characteristics3.append(CBMutableCharacteristic(type: CBUUID.bodySensorLocationUUID, properties: .read, value: nil, permissions: []))
        characteristics3.append(CBMutableCharacteristic(type: CBUUID.heartRateMeasurementUUID, properties: .notify, value: nil, permissions: []))
        service3.characteristics = characteristics3
        let service4 = CBMutableService(type: CBUUID(string: "6217FF49-AC7B-547E-EECF-016A06970BA9"), primary: true)
        var characteristics4: [CBCharacteristic] = []
        characteristics4.append(CBMutableCharacteristic(type: CBUUID(string: "6217FF4A-B07D-5DEB-261E-2586752D942E"), properties: [.read, .write], value: nil, permissions: []))
        service4.characteristics = characteristics4
        return VirtualPeripheral("Polar HR Sensor", uuid: CBUUID(), services: [service1, service2, service3, service4])
    }()
    
    static let proximityPeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.linkLossUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.alertLevelUUID, properties: [.read, .write], value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.txPowerUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.txPowerLevelUUID, properties: .read, value: nil, permissions: []))
        service2.characteristics = characteristics2
        let service3 = CBMutableService(type: CBUUID.immediateAlertUUID, primary: true)
        var characteristics3: [CBCharacteristic] = []
        characteristics3.append(CBMutableCharacteristic(type: CBUUID.alertLevelUUID, properties: [], value: nil, permissions: []))
        service3.characteristics = characteristics3
        return VirtualPeripheral("Proximity", uuid: CBUUID(), services: [service1, service2, service3])
    }()
    
    static let runningSpeedAndCadencePeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.deviceInformationUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.hardwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.modelNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.IEEE11073_20601RegulatoryCertificationDataListUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.PnPIDUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.softwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.serialNumberStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.manufacturerNameStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.firmwareRevisionStringUUID, properties: .read, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.systemIDUUID, properties: .read, value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.runningSpeedAndCadenceUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.RSCMeasurementUUID, properties: .notify, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.sensorLocationUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.RSCFeatureUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.SCControlPointUUID, properties: [.write, .indicate], value: nil, permissions: []))
        service2.characteristics = characteristics2
        return VirtualPeripheral("Polar HR Sensor", uuid: CBUUID(), services: [service1, service2])
    }()
    
    static let scanParametersPeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.scanParametersUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.scanIntervalWindowUUID, properties: [], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.scanRefreshUUID, properties: .notify, value: nil, permissions: []))
        service1.characteristics = characteristics1
        return VirtualPeripheral("Scan Parameters", uuid: CBUUID(), services: [service1])
    }()
    
    static let temperatureAlarmServicePeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID(string: "DEADF154-0000-0000-0000-0000DEADF154"), primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID(string: "CCCCFFFF-DEAD-F154-1319-740381000000"), properties: [.read, .notify], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID(string: "AAAAAAAA-DEAD-F154-1319-740381000000"), properties: .notify, value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID(string: "EDEDEDED-DEAD-F154-1319-740381000000"), properties: [.read, .write], value: nil, permissions: []))
        characteristics1.append(CBMutableCharacteristic(type: CBUUID(string: "C0C0C0C0-DEAD-F154-1319-740381000000"), properties: [.read, .write], value: nil, permissions: []))
        service1.characteristics = characteristics1
        return VirtualPeripheral("Temperature Alarm Service", uuid: CBUUID(), services: [service1])
    }()
    
    static let timePeripheral: VirtualPeripheral = {
        let service1 = CBMutableService(type: CBUUID.nextDSTChangeServiceUUID, primary: true)
        var characteristics1: [CBCharacteristic] = []
        characteristics1.append(CBMutableCharacteristic(type: CBUUID.timeWithDSTUUID, properties: .read, value: nil, permissions: []))
        service1.characteristics = characteristics1
        let service2 = CBMutableService(type: CBUUID.currentTimeServiceUUID, primary: true)
        var characteristics2: [CBCharacteristic] = []
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.referenceTimeInformationUUID, properties: .read, value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.currentTimeUUID, properties: [.read, .notify], value: nil, permissions: []))
        characteristics2.append(CBMutableCharacteristic(type: CBUUID.localTimeInformationUUID, properties: .read, value: nil, permissions: []))
        service2.characteristics = characteristics2
        let service3 = CBMutableService(type: CBUUID.referenceTimeUpdateServiceUUID, primary: true)
        var characteristics3: [CBCharacteristic] = []
        characteristics3.append(CBMutableCharacteristic(type: CBUUID.timeUpdateStateUUID, properties: .read, value: nil, permissions: []))
        characteristics3.append(CBMutableCharacteristic(type: CBUUID.timeUpdateControlPointUUID, properties: [], value: nil, permissions: []))
        service3.characteristics = characteristics3
        return VirtualPeripheral("Time", uuid: CBUUID(), services: [service1, service2, service3])
    }()
}

extension VirtualPeripheral: Equatable {
    static func == (lhs: VirtualPeripheral, rhs: VirtualPeripheral) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}