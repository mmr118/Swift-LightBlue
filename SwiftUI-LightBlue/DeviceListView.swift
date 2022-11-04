//
//  DeviceListView.swift
//  SwiftUI-LightBlue
//
//  Created by Rondon Monica on 04.11.22.
//  Copyright © 2022 Pluto-y. All rights reserved.
//

import SwiftUI

struct DeviceListView: View {

    @EnvironmentObject var manager: BluetoothManager

    @EnvironmentObject var btManager: BTManager

    var body: some View {

        List {

            ForEach(btManager.nearbyPeripheralInfos, id: \.self) { peripheral in
                cellContent(for: peripheral)
            }
        }
        .onAppear {
            manager.startScanPeripheral()
        }

    }

    @ViewBuilder func cellContent(for info: PeripheralInfos) -> some View {

        HStack {

            VStack {

                if info.RSSI == 127 {
                    Image("signal_strength_0")
                    Text("---")
                        .font(.caption)
                        .fontWeight(.medium)
                } else {
                    Image(SignalStrenght(rssi: info.RSSI).imageName)
                    Text("\(info.RSSI)")
                        .font(.caption)
                        .fontWeight(.medium)
                }
                
            }

            VStack {

                Text(info.peripheral.name ?? "Unknown")
                Text("\(0) Services")
                // peripheralInfo.advertisementData["kCBAdvDataServiceUUIDs"] as? NSArray, serviceUUIDs.count != 0 {
            }



        }
    }

}

struct DeviceListView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceListView()
            .environmentObject(Preview.manager)
    }
}


enum SignalStrenght: Int, CaseIterable {
    case _0
    case _1
    case _2
    case _3
    case _4
    case _5

    var imageName: String { "signal_strength_\(rawValue)" }

    init(rssi: Int) {
        switch labs(rssi) {
        case 0...40: self = ._5
        case 41...53: self = ._4
        case 54...65: self = ._3
        case 66...77: self = ._2
        case 77...89: self = ._1
        default: self = ._0
        }
    }


}
