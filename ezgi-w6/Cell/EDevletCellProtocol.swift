//
//  EDevletCellProtocol.swift
//  ezgi-w6
//
//  Created by Ezgi Sümer Günaydın on 22.03.2024.
//

import Foundation


protocol EDevletCellProtocol {
    static var reuseIdentifier: String {get}
    func configure(with edevlet: EDevlet?)
}
