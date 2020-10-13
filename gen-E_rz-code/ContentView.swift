//
//  ContentView.swift
//  gen-E_rz-code
//
//  Created by Ronald Zambrano on 10/4/20.
//  Copyright © 2020 Group3b. All rights reserved.
//

import SwiftUI
import UIKit
import XMLCoder

struct ContentView: View {
    
    @State public var accession: String = ""
    
    var body: some View {
        ZStack {
            
            // Background navy blue
            Rectangle()
                .foregroundColor(Color(red: 10/255, green: 77/255, blue: 174/255)).edgesIgnoringSafeArea(.all)
            
            // Background light blue
            Rectangle()
                .foregroundColor(Color(red: 86/255, green: 118/255, blue: 255/255))
                .frame(height: 200)
                .offset(x: 0, y: -200)
            
            VStack {
                
                
                // Image of Logo
 //               Logo()
  //                  .offset(x: 0, y: -98)
                
                // Text for user input
                Text("Please enter the gene accession number below")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .offset(x: -9, y: -10)
                
                // Text field for user input 剑
                TextField("NG_017013", text: $accession)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .offset(x: 0, y: -8)
                
                // Button
                Button(action: {
                    XMLParser()
                }) {
                    Text("Find my gene! 🧬")
                        .font(.system(size: 23))
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.all, 10)
                        .background(Color(red: 86/255, green: 118/255, blue: 255/255))
                        .cornerRadius(20)
                        .offset(x: 0, y: 20)
                }.padding()
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
