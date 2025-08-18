//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/18.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
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
                            print("from")
                        } label: {
                            Text("Откуда")
                                .foregroundColor(.ypGray)
                                .font(.regular17)
                                .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                                .padding(.leading, 16)
                                .contentShape(Rectangle())
                        }
                        
                        Button {
                            print("to")
                        } label: {
                            Text("Куда")
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
                        print("upgoesdown")
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
    }
}

#Preview {
    MainScreenView()
}
