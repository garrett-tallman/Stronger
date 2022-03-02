//
//  SearchBar.swift
//  Stronger
//
//  Created by Garrett Tallman on 3/1/22.
//

import SwiftUI
import Combine

struct SearchBar: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @Binding var searchTerm: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                .foregroundColor(.marineGreen)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("", text: $searchTerm)
                    .accentColor(.white)
                    .onSubmit {
                        print(searchTerm)
                    }
                Spacer()
                if searchTerm != "" {
                    Image(systemName: "x.circle.fill")
                        .onTapGesture {
                            searchTerm = ""
                        }
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
        .frame(height: DrawingConstants.cornerRadius * 4)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchTerm: .constant("test"))
    }
}
