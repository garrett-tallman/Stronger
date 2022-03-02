//
//  Excercies.swift
//  Stronger
//
//  Created by Garrett Tallman on 3/1/22.
//

import SwiftUI

enum FilterButtonType: String, CaseIterable {
    case anyBodyPart = "Any Body Part"
    case anyCategory = "Any Category"
}

struct Excercises: View {
    @State var searchTerm: String = ""
    @State var availableExercises = AvailableExercises()
    @State var selectedBodyPart: BodyPart?
    @State var selectedCategory: WorkoutCategory?
    @State var showCreateNewExercise: Bool = false
    @State var newExerciseName: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation{
                            self.showCreateNewExercise.toggle()
                        }
                    }, label: {
                        Image(systemName: "plus.app.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.marineGreen)
                    })
                }
                SearchBar(searchTerm: $searchTerm)
                HStack {
                    BodyPartFilterButton(selected: $selectedBodyPart)
                    CategoryFilterButton(selected: $selectedCategory)
                }
                ForEach(availableExercises.exerciseList, id: \.self) { exercise in
                    if displayExcerciseCell(exercise: exercise, searchTerm: searchTerm, bodyPart: selectedBodyPart, category: selectedCategory) {
                        ExercisesListCell(exercise: exercise)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            
            if self.showCreateNewExercise {
                GeometryReader { _ in
                    AddingWorkout(newExerciseName: $newExerciseName, exit: $showCreateNewExercise)
                }
                .background(
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation{
                                self.showCreateNewExercise.toggle()
                            }
                        }
                )
            }
        }
    }
    
    
    
    private func displayExcerciseCell(exercise: Exercise, searchTerm: String, bodyPart: BodyPart?, category: WorkoutCategory?) -> Bool {
        if (searchTerm.isEmpty || exercise.name.contains(searchTerm) || exercise.bodyPart.rawValue.contains(searchTerm)) &&
            (exercise.category == category || category == nil) &&
            (exercise.bodyPart == bodyPart || bodyPart == nil) {
            return true
        } else {
            return false
        }
    }
}

struct Excercises_Previews: PreviewProvider {
    static var previews: some View {
        Excercises()
    }
}
