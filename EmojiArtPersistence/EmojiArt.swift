//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Анастасия Стрекалова on 14.02.2020.
//  Copyright © 2020 Анастасия Стрекалова. All rights reserved.
//

import Foundation

struct EmojiArt: Codable {
    
    var url: URL?
    var imageData: Data?
    var emojis = [EmojiInfo]()
    
    struct EmojiInfo: Codable {
        let x: Int
        let y: Int
        let text: String
        let size: Int
    }
    
    init?(json: Data) {
        if let newValue = try? JSONDecoder().decode(EmojiArt.self, from: json) {
            self = newValue
        } else {
            return nil
        }
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init(url: URL, emojis: [EmojiInfo]) {
        self.url = url
        self.emojis = emojis
    }
    
    init(imageData: Data, emojis: [EmojiInfo]) {
        self.imageData = imageData
        self.emojis = emojis
    }
}
