//
//  User.swift
//  SearchBarPagination
//
//  Created by Maxim Macari on 17/10/2020.
//

import SwiftUI

struct User: Decodable, Hashable {
    
    var node_id: String
    var login: String
    var avatar_url: String
    
}

struct Results: Decodable  {
    var items: [User]
}
