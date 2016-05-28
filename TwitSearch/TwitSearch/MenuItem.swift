//
//  MenuItem.swift
//  TwitSearch
//
//  Created by student on 28.05.16.
//  Copyright © 2016 Владислав Навроцкий. All rights reserved.
//

import Foundation

struct MenuItemParameters {
    let title: String?
}

enum MenuItem {
    
    case FindTwits
    case Feed
    case Favorites
    
    static func allValues() -> [MenuItem] {
        return [.FindTwits, .Feed, .Favorites]
    }
    
    func parameters() -> MenuItemParameters {
        switch self {
        case .FindTwits:
            return MenuItemParameters(title: "Найти твиты по хештегу")
        case .Feed:
            return MenuItemParameters(title: "Новости")
        case .Favorites:
            return MenuItemParameters(title: "Избранные твиты")
        }
    }
}
