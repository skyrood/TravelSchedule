//
//  LoadState.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/23.
//

import Foundation

enum LoadState<T>: Equatable where T: Equatable {
    case idle
    case loading
    case success(T)
    case failure(ErrorType)
}

enum ErrorType: Equatable {
    case network
    case server
}
