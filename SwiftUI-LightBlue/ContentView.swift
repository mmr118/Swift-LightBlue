//
//  ContentView.swift
//  SwiftUI-LightBlue
//
//  Created by Rondon Monica on 03.11.22.
//  Copyright © 2022 Pluto-y. All rights reserved.
//

import SwiftUI
import CoreData

enum TabContent: Int, Identifiable {

    case info, about, logs

    var id: Int { rawValue }

}

struct ContentView: View {

    @ObservedObject var manager = BluetoothManager.shared
    @ObservedObject var btManager = BTManager()

    @State var selectedTab: TabContent? = nil

    var body: some View {

        NavigationStack {

            DeviceListView()
                .environmentObject(manager)
                .environmentObject(btManager)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {

                            Button("Info") {
                                selectedTab = .info
                            }

                            Spacer()

                            Button("About") {
                                selectedTab = .about
                            }

                            Spacer()

                            Button("Logs") {
                                selectedTab = .logs
                            }

                        }

                    }

                }
                .sheet(item: $selectedTab) { selection in
                    if let selection = selection {
                        NavigationStack {
                            content(for: selection)
                                .toolbar {
                                    ToolbarItem(placement: .cancellationAction) {
                                        Button("Close") {
                                            selectedTab = nil
                                        }
                                    }
                                }

                        }

                    }

                }

        }

    }

    @ViewBuilder private func content(for selection: TabContent) -> some View {

        switch selection {
        case .info: Text("Info")
        case .about: Text("About")
        case .logs: Text("Logs")
        }
    }

}


// MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Preview.manager)
    }
}
