//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

enum Route: Hashable {
    case settlement(kind: SelectionKind)
}

struct MainScreenView: View {
    @State private var path = NavigationPath()
    
    @State private var fromSettlement: String?
    @State private var toSettlement: String?
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        Color.clear.frame(width: 4)
                        
                        ForEach(0..<7) { index in
                            StoryExampleView()
                        }
                        
                        Color.clear.frame(width: 4)
                    }
                }
                .padding(.vertical, 24)
                .fixedSize(horizontal: false, vertical: true)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ypBlue)
                        .frame(height: 128)
                        .frame(maxWidth: .infinity)
                    
                    HStack(spacing: 16) {
                        VStack(spacing: 0) {
                            Button {
                                path.append(Route.settlement(kind: .from))
                            } label: {
                                Text(fromSettlement ?? "Откуда")
                                    .foregroundColor(.ypGray)
                                    .font(.regular17)
                                    .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                                    .padding(.leading, 16)
                                    .contentShape(Rectangle())
                            }
                            
                            Button {
                                path.append(Route.settlement(kind: .to))
                            } label: {
                                Text(toSettlement ?? "Куда")
                                    .foregroundColor(.ypGray)
                                    .font(.regular17)
                                    .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                                    .padding(.leading, 16)
                                    .contentShape(Rectangle())
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ypWhiteUniv)
                        )
                        
                        Button {
                            let temp = fromSettlement
                            fromSettlement = toSettlement
                            toSettlement = temp
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(.ypWhiteUniv)
                                    .frame(width: 36, height: 36)
                                
                                Image(systemName: "arrow.2.squarepath")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 16)
                                    .foregroundColor(.ypBlue)
                            }
                        }
                        .padding(.trailing, 16)
                    }
                    .padding(.leading, 16)
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
                
                Spacer()
            }
            .background(.ypWhite)
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .settlement(let kind):
                    SettlementSelectionView(
                        kind: kind,
                        initial: kind == .from ? (fromSettlement ?? "") : (toSettlement ?? "")
                    ) { selected in
                        switch kind {
                        case .from: fromSettlement = selected
                        case .to:   toSettlement   = selected
                        }
                        path.removeLast()
                    }
                default:
                    fatalError("Unsupported destination ID: \(route)")
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
}
