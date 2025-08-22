//
//  OrientationObserver.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/22.
//

import UIKit

final class OrientationObserver: ObservableObject {
    @Published var isLandscape: Bool = UIDevice.current.orientation.isLandscape

    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateOrientation),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
        updateOrientation()
    }

    @objc private func updateOrientation() {
        let orientation = UIDevice.current.orientation
        if orientation.isValidInterfaceOrientation {
            isLandscape = orientation.isLandscape
        }
    }
}
