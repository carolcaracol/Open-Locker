//
//  Parte1.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI
import UIKit

enum ImageSource: String, Codable {
    case gallery
    case bingo
    case randomShapes
    case cardView
    case newFrameView
}

// Armazenar informações da imagem
struct GalleryImage: Identifiable {
    let id: UUID
    let imageData: Data
    let url: URL
    let source: ImageSource
    let date: Date

    init(image: UIImage, url: URL, source: ImageSource) {
        self.id = UUID()
        self.imageData = image.pngData() ?? Data()
        self.url = url
        self.source = source
        self.date = Date()
    }

    var image: UIImage {
        return UIImage(data: imageData) ?? UIImage()
    }

    func dateFormatted() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter.string(from: date)
    }

    func frameImageName() -> String {
        switch source {
        case .gallery:
            return "Group 68"
        case .bingo:
            return "molduraGamarelo"
        case .randomShapes:
            return "molduraGverde"
        case .cardView:
            return "molduraGrosa"
        case .newFrameView:
            return "molduraGazul"
        }
    }
}

extension GalleryImage: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case imageData
        case url
        case source
        case date
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        imageData = try container.decode(Data.self, forKey: .imageData)
        url = try container.decode(URL.self, forKey: .url)
        source = try container.decode(ImageSource.self, forKey: .source)
        date = try container.decode(Date.self, forKey: .date)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(imageData, forKey: .imageData)
        try container.encode(url, forKey: .url)
        try container.encode(source, forKey: .source)
        try container.encode(date, forKey: .date)
    }
}

