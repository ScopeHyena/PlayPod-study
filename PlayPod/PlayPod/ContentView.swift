//
//  ContentView.swift
//  PlayPod
//
//  Created by Scope.H on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var event = TestModel()
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                    .fill(.white)
                    .frame(height: 300)
                    .padding(.horizontal, 7)
                    .padding(.bottom)
                    .overlay(
                        Pod_Display(event: event))
            }
            Spacer()
            
            Wheel(event: event)
        }
    }
}




#Preview {
    ContentView()
}
