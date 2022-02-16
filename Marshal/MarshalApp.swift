//
//  MarshalApp.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

@main
struct MarshalApp: App {
    @State var showSplash = true
    var body: some Scene {
        WindowGroup {
            ZStack{
                if showSplash{
                    Splash()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    showSplash = false
                            }
                        }
                }else{
                    Home()
                }
               
            }
            .background(Color("marshal_darkGrey"))
        }
    }

}
