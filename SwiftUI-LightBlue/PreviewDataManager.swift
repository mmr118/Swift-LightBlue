//
//  PreviewDataManager.swift
//  SwiftUI-LightBlue
//
//  Created by Rondon Monica on 04.11.22.
//  Copyright © 2022 Pluto-y. All rights reserved.
//

import Foundation

internal class PreviewDataManager: AppDataManager {

    fileprivate static let provider = PreviewDataManager()

    lazy var manager = BluetoothManager.shared

    internal required init() {
        super.init(inMemory: true)
        loadDefaultDataIfNeeded(forced: true)
        loadPreviewData()
    }

    private func loadPreviewData() {
        // no-op
    }

}

import SwiftUI

extension PreviewProvider {

    static var Preview: PreviewDataManager { .provider }

}
