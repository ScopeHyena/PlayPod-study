//
//  ContentView.swift
//  PlayPod
//
//  Created by Scope.H on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 300)
                .padding(.horizontal, 7)
                .padding(.bottom)
            Spacer()
            // Circular Control Area
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 300, height: 300)
                
                VStack {
                    // Menu Button
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.gray)
                        .padding(.bottom, 30)
                    
                    HStack {
                        // Previous Button
                        Image(systemName: "backward.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 20)
                        
                        // Center Button
                        Circle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 110, height: 110)
                        
                        // Next Button
                        Image(systemName: "forward.fill")
                            .foregroundColor(.gray)
                            .padding(.leading, 20)
                    }
                    
                    // Play/Pause Button
                    Image(systemName: "playpause.fill")
                        .foregroundColor(.gray)
                        .padding(.top, 30)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
