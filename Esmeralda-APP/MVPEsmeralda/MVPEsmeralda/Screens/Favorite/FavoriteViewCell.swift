//
//  MVPHomeCell.swift
//  MVPEsmeralda
//
//  Created by Gabriel Batista on 09/09/22.
//

import Foundation
import UIKit

class FavoriteViewCell: UICollectionViewCell {
    static let identifier = "collectionFavoriteCell"


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setText(text: String) {

    }
    
    
    private func setupViews() {
    }
    
    private func setupUI() {
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 15
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([

        ])
    }
    
    
}
