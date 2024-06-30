//
//  ContentView.swift
//  PlayPod
//
//  Created by Scope.H on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var eventTest = ButtonEventTestModel()
    @State private var startLocation: CGPoint?
    @State private var lastRotation: Double = 0
    @State private var rotation: Double = 0
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
                        Pod_Display(eventTest: eventTest))
            }
            Spacer()
            // Circular Control Area
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 300, height: 300)
                    
                
                
                VStack {
                    // Menu Button
                    ZStack{
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.gray)
                            .padding(.bottom, 30)
                        iPodButton(action: {eventTest.text = "MENU Key Pressed"}, text: nil, systemImage: nil)
                    }
                    .contentShape(Circle())
                    .gesture(DragGesture(minimumDistance: 0), including: .gesture)
                    
                    HStack {
                        // Previous Button
                        ZStack {
                            Image(systemName: "backward.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 20)
                            iPodButton(action: {eventTest.text = "Backward Key Pressed"}, text: nil, systemImage: nil)
                        }
                        .contentShape(Circle())
                        .gesture(DragGesture(minimumDistance: 0), including: .gesture)
                        // Center Button
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 100, height: 100)
                            iPodButton(action: {eventTest.text = "OK Key Pressed"}, text: nil, systemImage: nil)
                        }
                        .contentShape(Circle())
                        .gesture(DragGesture(minimumDistance: 0), including: .gesture)
                        // Next Button
                        ZStack {
                            Image(systemName: "forward.fill")
                                .foregroundColor(.gray)
                                .padding(.leading, 20)
                            iPodButton(action: {eventTest.text = "Forward Key Pressed"}, text: nil, systemImage: nil)
                        }
                        .contentShape(Circle())
                        .gesture(DragGesture(minimumDistance: 0), including: .gesture)
                    }
                    
                    // Play/Pause Button
                    ZStack {
                        Image(systemName: "playpause.fill")
                            .foregroundColor(.gray)
                            .padding(.top, 30)
                        iPodButton(action: {eventTest.text = "Play/Pause Key Pressed"}, text: nil, systemImage: nil)
                    }
                    .contentShape(Circle())
                    .gesture(DragGesture(minimumDistance: 0), including: .gesture)
                }
            }
            //TODO: Fix Rotation (with 1 finger) gesture
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        if self.startLocation == nil {
                            self.startLocation = value.location
                        }
                        
                        let center = CGPoint(x: 100, y: 100)
                        let startAngle = angleBetween(point1: center, point2: self.startLocation!)
                        let currentAngle = angleBetween(point1: center, point2: value.location)
                        
                        let angleDifference = currentAngle - startAngle
                        self.rotation = self.lastRotation + angleDifference.degrees
                        
                        // 각도에 따라 필요한 동작 수행
                        if self.rotation.truncatingRemainder(dividingBy: 360) > 15 {
                            self.eventTest.text = "Wheel Rotated Right"
                            self.lastRotation = self.rotation
                        } else if self.rotation.truncatingRemainder(dividingBy: 360) < -15 {
                            self.eventTest.text = "Wheel Rotated Left"
                            self.lastRotation = self.rotation
                        }
                    }
                    .onEnded { _ in
                        self.startLocation = nil
                    }
            )
            
            
            Spacer()
        }
    }
    
    
    private func angleBetween(point1: CGPoint, point2: CGPoint) -> Angle {
        let deltaY = point2.y - point1.y
        let deltaX = point2.x - point1.x
        let radians = atan2(deltaY, deltaX)
        return Angle(radians: radians)
    }
}




#Preview {
    ContentView()
}
