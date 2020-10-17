//
//  SearchUser.swift
//  SearchBarPagination
//
//  Created by Maxim Macari on 17/10/2020.
//

import SwiftUI

class SearchUsers: ObservableObject{
    
    @Published var searchedUser: [User] = []
    
    
    //User query
    @Published var query = ""
    
    
    //Current result page
    @Published var page = 1
    
    func find(){
        
        //removing spaces
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
        
        //you can give your own length
        let url = "https://api.github.com/search/users?q=\(searchQuery)&page=\(page)&per_page=10"
        
        let session = URLSession(configuration: .default)
        
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let users = try JSONDecoder().decode(Results.self, from: jsonData)
                
              //appending to searched Users
                
                DispatchQueue.main.sync {
                    //removing data if its new request..
                    if self.page == 1 {
                        self.searchedUser.removeAll()
                    }
                    
                    
                    //Check for rendundant data.
                    //The property 'union' removes duplicates.
                    self.searchedUser = Array(Set(self.searchedUser).union(Set(users.items)))
                    
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
