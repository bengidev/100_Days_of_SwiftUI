//
//  FileManager-DocumentsDirectory.swift
//  Bucketlist
//
//  Created by Bambang Tri Rahmat Doni on 27/09/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = self.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
