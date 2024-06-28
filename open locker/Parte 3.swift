//
//  Parte 3.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import Foundation
import SwiftUI

extension UserDefaults {
    private static let savedImagePathsKey = "savedImagePathsKey"
    private static let savedImageSourcesKey = "savedImageSourcesKey"
    private static let deletedImagesKey = "deletedImagesKey"
    private static let stickersKey = "stickersKey"
    private static let stickerPositionsKey = "stickerPositionsKey"
    private static let stickerSizesKey = "stickerSizesKey"

    func saveImagePaths(_ imagePaths: [String]) {
        set(imagePaths, forKey: Self.savedImagePathsKey)
    }

    func saveImageSources(_ imageSources: [String]) {
        set(imageSources, forKey: Self.savedImageSourcesKey)
    }

    func saveDeletedImages(_ images: [GalleryImage]) {
        let data = try? JSONEncoder().encode(images)
        set(data, forKey: Self.deletedImagesKey)
    }

    func saveStickers(_ stickers: [String]) {
        set(stickers, forKey: Self.stickersKey)
    }

    func saveStickerPositions(_ positions: [String: CGPoint]) {
        let data = try? JSONEncoder().encode(positions)
        set(data, forKey: Self.stickerPositionsKey)
    }

    func saveStickerSizes(_ sizes: [String: CGSize]) {
        let data = try? JSONEncoder().encode(sizes)
        set(data, forKey: Self.stickerSizesKey)
    }

    func getSavedImagePaths() -> [URL] {
        guard let paths = array(forKey: Self.savedImagePathsKey) as? [String] else { return [] }
        return paths.compactMap { URL(string: $0) }
    }

    func getImageSources() -> [String] {
        guard let sources = array(forKey: Self.savedImageSourcesKey) as? [String] else { return [] }
        return sources
    }

    func getDeletedImages() -> [GalleryImage] {
        guard let data = data(forKey: Self.deletedImagesKey) else { return [] }
        return (try? JSONDecoder().decode([GalleryImage].self, from: data)) ?? []
    }

    func getStickers() -> [String] {
        return array(forKey: Self.stickersKey) as? [String] ?? []
    }

    func getStickerPositions() -> [String: CGPoint] {
        guard let data = data(forKey: Self.stickerPositionsKey),
              let positions = try? JSONDecoder().decode([String: CGPoint].self, from: data) else {
            return [:]
        }
        return positions
    }

    func getStickerSizes() -> [String: CGSize] {
        guard let data = data(forKey: Self.stickerSizesKey),
              let sizes = try? JSONDecoder().decode([String: CGSize].self, from: data) else {
            return [:]
        }
        return sizes
    }
}




