//
//  iPodButton.swift
//  PlayPod
//
//  Created by Scope.H on 6/30/24.
//

import SwiftUI

struct iPodButton: View {
    let action: () -> Void
    let text: String?
    let systemImage: String?
    let feedback = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        Button(action: action) {
            VStack {
                if let systemImage = systemImage {
                    Image(systemName: systemImage)
                        .foregroundColor(.secondary)
                }
                if let text = text {
                    Text(text)
                        .foregroundColor(.secondary)
                }
            }
            .frame(width: 85, height: 85)
            .background(Color.clear)
            .cornerRadius(22)
        }
        .onAppear {
            feedback.prepare()
        }
    }
}

#Preview {
    iPodButton(action: { print("Menu") }, text: nil, systemImage: "figure")
}
