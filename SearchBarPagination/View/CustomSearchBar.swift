//
//  CustomSearchBar.swift
//  SearchBarPagination
//
//  Created by Maxim Macari on 17/10/2020.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @ObservedObject var searchData: SearchUsers
    
    
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                
                TextField("Search", text: $searchData.query)
                    .autocapitalization(.none)
                
                
                
                
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            
            
            if !searchData.searchedUser.isEmpty{
                ScrollView(.vertical, showsIndicators: true){
                    LazyVStack(alignment: .leading, spacing: 12){
                        
                        //safe wrap
                        ForEach(searchData.searchedUser, id: \.self){ user in
                            
                            VStack(alignment: .leading, spacing: 6){
                                Text(user.login)
                                
                                
                                Divider()
                                
                            }
                            .padding(.horizontal)
                            //PAGINATION
                            //If the user reaches the bottom of the seardch results then it fetches the next set of results(page + 1).
                            .onAppear{
                                
                                if user.node_id == searchData.searchedUser.last?.node_id && searchData.page <= 3{
                                    
                                    searchData.page += 1
                                    searchData.find()
                                    
                                    
                                }
                                
                            }
                        }
                    }
                    .padding(.top)
                }
                .frame(height: 240)
            }
            
            
            
        }
        .background(Color("Color"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        
        
    }
}
