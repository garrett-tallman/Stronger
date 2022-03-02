//
//  testing.swift
//  Stronger
//
//  Created by Garrett Tallman on 3/2/22.
//

import SwiftUI

struct testing: View {
    var body: some View {
        Text("Options")
            .contextMenu {
                Button {
                    print("Change country setting")
                } label: {
                    Label("Choose Country", systemImage: "globe")
                }

                Button {
                    print("Enable geolocation")
                } label: {
                    Label("Detect Location", systemImage: "location.circle")
                }
            }
    }
}

struct testing_Previews: PreviewProvider {
    static var previews: some View {
        testing()
    }
}
