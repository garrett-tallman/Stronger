//
//  ExercisesListCell.swift
//  Stronger
//
//  Created by Garrett Tallman on 3/1/22.
//

import SwiftUI

struct ExercisesListCell: View {
    var exercise: Exercise
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                .foregroundColor(.marineGreen)
            HStack {
                exercise.icon
                    .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text(exercise.name)
                        .bold()
                    Text(exercise.bodyPart.rawValue.capitalized)
                }
            }
            .foregroundColor(.white)
        }
        .frame(height: 60)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
    }
}

struct ExercisesListCell_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesListCell(exercise:
                            Exercise(name: "Bench Press",
                                     bodyPart: .chest,
                                     category: .barbell,
                                     icon: Image(systemName: "questionmark")))
    }
}
