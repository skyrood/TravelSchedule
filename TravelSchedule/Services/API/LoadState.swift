//
//  LoadState.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/23.
//

import Foundation

enum LoadState: Equatable {
    case idle
    case loading
    case success([Settlement])
    case failure(ErrorType)
}

enum ErrorType: Equatable {
    case network
    case server
}
