//
//  FavoritesResponseElement.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 04/12/21.
//

import Foundation

// MARK: - FavoritesResponseElement
struct FavoritesResponseElement: Codable {
    let id: Int
    let name, favoritesResponseDescription: String
    let favoritesResponseDefault: Bool
    let owner: Owner
    let createdAt: String
    let visibility: String
    let products: [String: Product]
    let accessHash: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case favoritesResponseDescription = "description"
        case favoritesResponseDefault = "default"
        case createdAt, visibility, accessHash, products, owner
    }
}

// MARK: - Owner
struct Owner: Codable {
    let name, email, linioID: String

    enum CodingKeys: String, CodingKey {
        case name, email
        case linioID = "linioId"
    }
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let name: String
    let wishListPrice: Int
    let slug, url: String
    let image: String
    let linioPlusLevel: Int
    let conditionType: String
    let freeShipping, imported, active: Bool
}

typealias FavoritesResponse = [FavoritesResponseElement]
