//
//  Parte2.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import UIKit

extension FileManager {
    static func saveImage(_ image: UIImage) -> URL? {
        guard let data = image.pngData() else { return nil }
        let filename = UUID().uuidString
        let url = Self.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)

        do {
            try data.write(to: url)
            return url
        } catch {
            print("Failed to save image: \(error)")
            return nil
        }
    }

    static func loadImage(at url: URL) -> UIImage? {
        guard let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }
}






