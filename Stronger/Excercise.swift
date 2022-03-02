//
//  Workout.swift
//  Stronger
//
//  Created by Garrett Tallman on 3/1/22.
//

import Foundation
import SwiftUI

enum BodyPart: String, CaseIterable, Identifiable {
    case core
    case arms
    case back
    case chest
    case legs
    case shoulders
    case other
    case olympic
    case cardio
    var id: Self { self }
}

enum WorkoutCategory: String, CaseIterable, Identifiable {
    case barbell
    case dumbbell
    case machine
    case other
    case weightedBodyweight = "Weighted Bodyweight"
    case assistedBodyweight = "Assisted Bodyweight"
    case repsOnly = "Reps Only"
    case cardio
    case duration
    var id: Self { self }
}

struct Exercise {
    var name: String
    var bodyPart: BodyPart
    var category: WorkoutCategory
    var icon: Image
}

extension Exercise: Hashable {
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name == rhs.name && lhs.bodyPart == rhs.bodyPart && lhs.category == rhs.category
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(bodyPart)
        hasher.combine(category)
    }
}

struct AvailableExercises {
    var exerciseList: [Exercise]
    
    init() {
        exerciseList = [
            Exercise(
                name: "Bench Press",
                bodyPart: .chest,
                category: .barbell,
                icon: Image(systemName: "questionmark")
            ),
            Exercise(
                name: "Squat",
                bodyPart: .legs,
                category: .barbell,
                icon: Image(systemName: "questionmark")
            ),
            Exercise(
                name: "Plank",
                bodyPart: .core,
                category: .weightedBodyweight,
                icon: Image(systemName: "questionmark")
            ),
            Exercise(
                name: "Shoulder Press",
                bodyPart: .shoulders,
                category: .dumbbell,
                icon: Image(systemName: "questionmark")
            )
        ]
    }
    
}
