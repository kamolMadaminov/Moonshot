//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Kamol Madaminov on 30/03/25.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file).json in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file): key \(key.stringValue) not found: \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context){
            fatalError("Failed to decode \(file): type mismatch: \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context){
            fatalError("Failed to decode \(file): value not found: \(context.debugDescription), expected \(type)")
        } catch DecodingError.dataCorrupted(_){
            fatalError("Failed to decode \(file): data corrupted")
        } catch{
            fatalError("Failed to decode \(file): \(error.localizedDescription)")
        }
        
        
    }
}
