//
//  AddingWorkout.swift
//  Stronger
//
//  Created by Garrett Tallman on 3/1/22.
//

import SwiftUI

struct AddingWorkout: View {
    @State private var selection: Int = 0
    @State private var selectedBodyPart: BodyPart? = nil
    @State private var selectedCategory: WorkoutCategory? = nil
    @Binding var newExerciseName: String
    @Binding var exit: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
            VStack {
                HStack {
                    Button {
                        exit.toggle()
                    } label: {
                        Image(systemName: "x.square.fill")
                            .frame(width: 50)
                    }

                    Spacer()
                    Text("Create New Exercise")
                        .bold()
                    Spacer()
                    Button {
                        print("New Exercise Name: \(newExerciseName)")
                        print("Icon: \(newExerciseName[newExerciseName.startIndex])")
                        print("Body Part: \(selectedBodyPart ?? .arms)")
                        print("Category: \(selectedCategory ?? .barbell)")
                    } label: {
                        Text("Save")
                            .frame(width: 50)
                    }
                }
                .font(.system(size:20))
                .foregroundColor(.marineGreen)
                .padding(.bottom)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.marineGreen)
                        .frame(height: 30)
                    TextField("", text: $newExerciseName)
                        .accentColor(.white)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom)
                VStack {
                    HStack {
                        Text("Body Part:").bold().font(.title2)
                        Spacer()
                        Menu {
                            Picker(selection: $selectedBodyPart) {
                                ForEach(BodyPart.allCases) { bodyPart in
                                    Text(bodyPart.rawValue.capitalized).tag(bodyPart as BodyPart?)
                                }
                            } label: {}
                        } label: {
                            if selectedBodyPart == nil {
                                Text("None")
                                    .font(.headline)
                            } else {
                                Text(selectedBodyPart!.rawValue.capitalized)
                                    .font(.headline)
                            }
                        }
                    }
                    .foregroundColor(.marineGreen)
                    .padding(.bottom)
                    Divider()
                        .padding(.bottom)
                    HStack {
                        Text("Category:").bold().font(.title2)
                        Spacer()
                        Menu {
                            Picker(selection: $selectedCategory) {
                                ForEach(WorkoutCategory.allCases) { category in
                                    Text(category.rawValue.capitalized).tag(category as WorkoutCategory?)
                                }
                            } label: {}
                        } label: {
                            if selectedCategory == nil {
                                Text("None")
                                    .font(.headline)
                            } else {
                                Text(selectedCategory!.rawValue.capitalized)
                                    .font(.headline)
                            }
                        }
                    }.foregroundColor(.marineGreen)
                }
                .padding(.horizontal)
                Spacer()
                
            }
            .foregroundColor(.white)
            .padding([.horizontal, .top])
        }
        .frame(height: 250)
        .padding(.horizontal)
    }
}

struct AddingWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddingWorkout(newExerciseName: .constant("New Name"), exit: .constant(true))
    }
}
