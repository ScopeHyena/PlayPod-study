//
//  Pod Display.swift
//  PlayPod
//
//  Created by Scope.H on 6/30/24.
//

import SwiftUI

struct Pod_Display: View {
    @ObservedObject var event: TestModel
    var body: some View {
        Text(event.text)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
    }
}

#Preview(traits: .fixedLayout(width: 320, height: 240)) {
    Pod_Display(event: TestModel())
}
