//
//  Bundle.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 1/29/25.
//

import Foundation

extension Bundle {
    
    public func decode<T: Decodable>(_ type: T.Type,
                                from file:String,
                                dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                                keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T{
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to location \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        return decodedData
                
    }
}

