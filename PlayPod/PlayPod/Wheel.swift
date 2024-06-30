//
//  Wheel.swift
//  PlayPod
//
//  Created by Scope.H on 6/30/24.
//

import SwiftUI
import AVFoundation

struct Wheel: View {
    @State private var lastAngle: CGFloat = 0
    @State private var counter: CGFloat = 0
    @ObservedObject var event: TestModel
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Circle()
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8)
                        .foregroundColor(Color("Wheel"))
                        .gesture(DragGesture()
                            .onChanged { v in
                                var angle = atan2(v.location.x - geometry.size.width * 0.8 / 2, geometry.size.width * 0.8 / 2 - v.location.y) * 180 / .pi
                                if (angle < 0) { angle += 360 }
                                let theta = self.lastAngle - angle
                                self.lastAngle = angle
                                if (abs(theta) < 20) {
                                    self.counter += theta
                                }
                                if (self.counter > 20) {
                                    AudioServicesPlaySystemSound(1104)
                                    event.text = "Wheel Turned counterclockwise\n(\(Int(angle / 36.0)))"
                                } else if (self.counter < -20) {
                                    AudioServicesPlaySystemSound(1104)
                                    event.text = "Wheel Turned clockwise\n(\(Int(angle / 36.0)))"
                                }
                                if (abs(self.counter) > 20) { self.counter = 0 }
                            }
                            .onEnded { v in
                                self.counter = 0
                            }
                        )
                        .overlay(
                            Circle()
                                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                                .foregroundColor(Color("Case"))
                                .gesture(
                                    TapGesture(count: 1)
                                        .onEnded {
                                            AudioServicesPlaySystemSound(1104)
                                            event.text = "Action Button Pressed"
                                        }
                                )
                        )
                    
                    
                    
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal")
                            .font(.subheadline)
                            .foregroundColor(Color("WheelText"))
                            .padding()
                    }
                        .offset(y: -(geometry.size.width * 0.28))
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded {
                                    AudioServicesPlaySystemSound(1104)
                                    event.text = "MENU Button Pressed"
                                }
                        )
        
                    
                    Button(action: {}) {
                        Image(systemName: "playpause.fill")
                            .font(.subheadline)
                            .foregroundColor(Color("WheelText"))
                            .padding()
                    }
                        .offset(y: geometry.size.width * 0.28)
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded {
                                    AudioServicesPlaySystemSound(1104)
                                    event.text = "Play/Pause Button Pressed"
                                }
                        )
                    
                    
                    Button(action: {}) {
                        Image(systemName: "forward.end.alt.fill")
                            .font(.subheadline)
                            .foregroundColor(Color("WheelText"))
                            .padding()
                    }
                        .offset(x: geometry.size.width * 0.28)
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded {
                                    AudioServicesPlaySystemSound(1104)
                                    event.text = "Next Button Pressed"
                                }
                        )
                    
                    
                    Button(action: {}) {
                        Image(systemName: "backward.end.alt.fill")
                            .font(.subheadline)
                            .foregroundColor(Color("WheelText"))
                            .padding()
                    }
                        .offset(x: -(geometry.size.width * 0.28))
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded {
                                    AudioServicesPlaySystemSound(1104)
                                    event.text = "Prev Button Pressed"
                                }
                        )
                        
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 300)) {
    Wheel(event: TestModel())
}
