//
//  PlaylistModel.swift
//  UTubeClown
//
//  Created by Mauricio Zarate on 30/06/22.
//

import Foundation

struct PlaylistModel: Decodable {
    let kind: String
    let etag: String
    let pageInfo: PageInfo
    let items: [Items]
    
    struct PageInfo: Decodable{
        let totalResults: Int
        let resultsPerPage: Int
    }
    
    struct Items: Decodable{
        let kind : String
        let etag : String
        let id: ID
        
        struct ID: Decodable {
            let kind: String
            let channelId: String
            
        }
        
        struct Snippet: Decodable{
            let publishedAt: String
            let channelId: String
            let title: String
            let description: String
            let thumbnails: Thumbnails
            
            struct Thumbnails: Decodable {
                let medium: Medium
                
                struct Medium: Decodable {
                    let url: String
                    let width: Int
                    let height: Int
                }
            }
            
            
            let channelTitle: String
            let liveBroadcastContent: String
            let publishTime: String
        }
        
    }
}
