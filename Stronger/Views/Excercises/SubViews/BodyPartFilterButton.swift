//
//  AnyBodyPart.swift
//  Stronger
//
//  Created by Garrett Tallman on 3/1/22.
//

import SwiftUI

struct BodyPartFilterButton: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var selected: BodyPart?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                .foregroundColor(.marineGreen)
            Picker("Body Part", selection: $selected) {
                Text("Any Body Part").tag(nil as BodyPart?)
                ForEach(BodyPart.allCases) { bodyPart in
                    Text(bodyPart.rawValue.capitalized).tag(bodyPart as BodyPart?)
                }
            }
            .pickerStyle(.menu)
            .accentColor(.white)
        }
        .frame(height: DrawingConstants.cornerRadius * 3)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
    }
}

struct BodyPartFilterButton_Previews: PreviewProvider {
    static var previews: some View {
        BodyPartFilterButton(selected: .constant(nil))
    }
}
