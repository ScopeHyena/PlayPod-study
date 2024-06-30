//
//  Pod Display.swift
//  PlayPod
//
//  Created by Scope.H on 6/30/24.
//

import SwiftUI

struct Pod_Display: View {
    @ObservedObject var eventTest: ButtonEventTestModel
    var body: some View {
        Text(eventTest.text)
    }
}

#Preview(traits: .fixedLayout(width: 320, height: 240)) {
    Pod_Display(eventTest: ButtonEventTestModel())
}
