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
    @AppStorage("showLogin") var showLogin = false
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
                    if showLogin{
                        Login()
                            .transition(AnyTransition.slide)
                            .animation(.default)
                    }else{
                        Home()
                    }
                }
               
            }.onAppear{
                showLogin = false
            }
            .background(Color("marshal_Grey"))
        }
    }

}
