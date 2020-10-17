//
//  ContentView.swift
//  SearchBarPagination
//
//  Created by Maxim Macari on 17/10/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .preferredColorScheme(.dark)
                .navigationTitle("Github Users")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
