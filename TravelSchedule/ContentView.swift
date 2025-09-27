//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func testGetServicesBetweenStations() {
        Task {
            do {
                let services = try await NetworkService.shared.getServicesBetweenStations(
                    from: "c146",
                    to: "c213"
                )
                print("Successfully fetched services: \(services)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func testGetStationSchedule() {
        Task {
            do {
                let schedule = try await NetworkService.shared.getStationSchedule(
                    station: "s9600213"
                )
                print("Successfully fetched station schedule: \(schedule)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func testGetRouteStations() {
        Task {
            do {
                let routeStations = try await NetworkService.shared.getRouteStations(uid: "FV-5553_250809_c8565_12")
                print("Successfully fetched route stations: \(routeStations)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func testGetNearestStations() {
        Task {
            do {
                let stations = try await NetworkService.shared.getNearestStations(latitude: 50.440046, longitude: 40.4882367, distance: 50)
                print("Successfully fetched stations: \(stations)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func testGetNearestSettlement() {
        Task {
            do {
                let settlement = try await NetworkService.shared.getNearestSettlement(
                    latitude: 43.901944,
                    longitude: 43.221389,
                    distance: 50,
                    lang: nil,
                    format: nil
                )
                print("Successfully fetched nearest settlement: \(settlement)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func testGetCarrierInfo() {
        Task {
            do {
                let carrierInfo = try await NetworkService.shared.getCarrierInfo(
                    code: "63438"
                )
                print("Successfully fetched carrier info: \(carrierInfo)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func testGetAllstations() {
        Task {
            do {
                let allStations = try await NetworkService.shared.getAllStations()
                
                print("Successfully fetched all stations.\nCountries count: \(String(describing: allStations.countries?.count ?? -1))\nFirst country name: \(String(describing: allStations.countries?[0].title ?? "кажется, не удалось ничего получить"))")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func testGetCopyrightInfo() {
        Task {
            do {
                let copyright = try await NetworkService.shared.getCopyrightInfo()
                print("Successfully fetched copyright: \(copyright)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
