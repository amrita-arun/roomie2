//
//  ContentView.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if viewModel.isUserLoggedIn() == true {
                HomeView()
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
