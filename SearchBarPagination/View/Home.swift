//
//  Home.swift
//  SearchBarPagination
//
//  Created by Maxim Macari on 17/10/2020.
//

import SwiftUI

struct Home: View {
    
    @StateObject var searchData = SearchUsers()
    
    var body: some View {
        
        VStack{
            
            CustomSearchBar(searchData: searchData)
            
            Spacer()
            
        }
        //'onChange' will fire the block whenever the content is changed. Thus, the data fetch rate will be high since for every letter being typed it will be fetched. So we are using a simple logic here if the user stops the typing for 0.4 sec then we start fetching the data.
        .onChange(of: searchData.query, perform: { (newData) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if newData == searchData.query {
                    print("search: \(newData)")
                    
                    if searchData.query != ""{
                        //search user
                        searchData.page = 1
                        searchData.find()
                    }else{
                        //removing all searched Data...
                        searchData.searchedUser.removeAll()
                        
                    }
                }
            }
        })
    }
}

