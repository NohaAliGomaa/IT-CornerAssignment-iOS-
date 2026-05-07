//
//  Extentions.swift
//  Leany
//
//  Created by Ahmed Fareed on 06/05/2026.
//

import Foundation
import UIKit

extension String {
    var htmlToString: String {
        guard let data = self.data(using: .utf8) else { return self }
        let attributed = try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        )
        return attributed?.string ?? self
    }
}
