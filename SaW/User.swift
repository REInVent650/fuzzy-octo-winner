//
//  ShakeandWipe.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI

struct ShakeandWipe: View {
    var body: some View {
        VStack {
            Text("Log in to Shake and Wipe")
                .font(.system(size: 25, weight: .regular, design: .default))
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.primary)
                .background(.teal)
            VStack {
                Spacer()
                VStack {
                    Text("Please enter Name, Email and Password")
                    Text("Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        .padding()
                    Text("Email")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                    Text("Password")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                    Text("Continue".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .background(.teal)
                        .font(.system(size: 20, weight: .regular, design: .default))
                    Text("By clicking continue you agree with our Privacy Policy")
                        .padding()
                        .font(.footnote.weight(.regular))
                    Text("Reset Password")
                        .font(.body.weight(.medium))
                        .foregroundColor(.teal)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ShakeandWipe_Previews: PreviewProvider {
    static var previews: some View {
        ShakeandWipe()
    }
}
