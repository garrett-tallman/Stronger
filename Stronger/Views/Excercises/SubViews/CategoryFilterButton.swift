//
//  CategoryFilterButton.swift
//  Stronger
//
//  Created by Garrett Tallman on 3/1/22.
//

import SwiftUI

struct CategoryFilterButton: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var selected: WorkoutCategory?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                .foregroundColor(.marineGreen)
            Picker("Category", selection: $selected) {
                Text("Any Category").tag(nil as WorkoutCategory?)
                ForEach(WorkoutCategory.allCases) { category in
                    Text(category.rawValue.capitalized).tag(category as WorkoutCategory?)
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

struct CategoryFilterButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFilterButton(selected: .constant(nil))
    }
}
