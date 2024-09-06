//
//  ContentView.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var user: User
    @EnvironmentObject var house: House
    
    var body: some View {
        Group {
            if viewModel.isUserLoggedIn() == true {
                HomeView(user: User())
                    .environmentObject(user)
                    .environmentObject(house)
                
            }
            else {
                LogInView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
