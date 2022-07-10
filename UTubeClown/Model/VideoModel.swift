//
//  VideoModel.swift
//  UTubeClown
//
//  Created by Mauricio Zarate on 03/07/22.
//

import Foundation

// MARK: - VideoModel
struct VideoModel: Codable {
    let kind, etag: String
    let items: [Item]
    let pageInfo: PageInfo
    
    // MARK: - Item
    struct Item: Codable {
        let kind, etag, id: String
        let snippet: Snippet
        let contentDetails: ContentDetails
        let status: Status
        let statistics: Statistics
        let player: Player
        let topicDetails: TopicDetails
        let recordingDetails: RecordingDetails
        
        // MARK: - Snippet
        struct Snippet: Codable {
            let publishedAt: Date
            let channelId, title, description: String
            let thumbnails: Thumbnails
            let channelTitle, categoryId, liveBroadcastContent: String
            let localized: Localized
            let defaultAudioLanguage: String

            enum CodingKeys: String, CodingKey {
                case publishedAt
                case channelId
                case title
                case description
                case thumbnails, channelTitle
                case categoryId 
                case liveBroadcastContent, localized, defaultAudioLanguage
            }
            
            struct Thumbnails: Codable {
                let thumbnailsDefault, medium, high, standard: Default
                let maxres: Default

                enum CodingKeys: String, CodingKey {
                    case thumbnailsDefault = "default"
                    case medium, high, standard, maxres
                }
                
                // MARK: - Default
                struct Default: Codable {
                    let url: String
                    let width, height: Int
                }

            }
            // MARK: - Localized
            struct Localized: Codable {
                let title, localizedDescription: String

                enum CodingKeys: String, CodingKey {
                    case title
                    case localizedDescription = "description"
                }
            }

        }
        // MARK: - ContentDetails
        struct ContentDetails: Codable {
            let duration, dimension, definition, caption: String
            let licensedContent: Bool
            let contentRating: RecordingDetails
            let projection: String
        }
        // MARK: - Status
        struct Status: Codable {
            let uploadStatus, privacyStatus, license: String
            let embeddable, publicStatsViewable, madeForKids: Bool
        }
        // MARK: - Statistics
        struct Statistics: Codable {
            let viewCount, likeCount, favoriteCount, commentCount: String
        }
        // MARK: - Player
        struct Player: Codable {
            let embedHTML: String

            enum CodingKeys: String, CodingKey {
                case embedHTML = "embedHtml"
            }
        }
        
        // MARK: - TopicDetails
        struct TopicDetails: Codable {
            let topicCategories: [String]
        }
        
        // MARK: - RecordingDetails
        struct RecordingDetails: Codable {
        }

    }
    
    // MARK: - PageInfo
    struct PageInfo: Codable {
        let totalResults, resultsPerPage: Int
    }
}






