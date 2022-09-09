//
//  UILabel+setuptext.swift
//  MVPEsmeralda
//
//  Created by Gabriel Batista on 08/09/22.
//

import Foundation
import UIKit

// esta extensão foi criada para configurar as labels com uma chamada de função.
extension UILabel {
    internal func setupText(info: LabelInfo) {
        self.text = info.text
        self.font = .systemFont(ofSize: info.size, weight: info.weight)
    }
}
