//
//  MVPHomeCell.swift
//  MVPEsmeralda
//
//  Created by Gabriel Batista on 09/09/22.
//

import Foundation
import UIKit

class PedidosViewCell: UICollectionViewCell {
    static let identifier = "collectionPedidosCell"

    private let pizzaImage: UIImageView = CustomViews.newImage()
    
    private let titleLabel = CustomViews.newLabel()
    
    private let descriptionLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 2
        
        return lbl
    }()
    
    private let valueLabel = CustomViews.newLabel()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
        self.setupViews()
        self.setupConstraints()
        self.setText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        self.contentView.addSubview(pizzaImage)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(valueLabel)
    }
    
    private func setText() {
        self.titleLabel.setupText(info: LabelInfo(text: "Pedido #1234", size: 17, weight: .semibold))
        self.titleLabel.textColor = .black
        
        self.descriptionLabel.setupText(info: LabelInfo(text: "lorem ipsum lorem ipsum lorem ipsum lorem ipsum", size: 15, weight: .regular))
        self.titleLabel.textColor = .black
        
        self.valueLabel.setupText(info: LabelInfo(text: "R$ 40,00", size: 15, weight: .regular))
        self.titleLabel.textColor = .black
    }
    
    private func setupUI() {
        self.backgroundColor = .lightGray
        self.pizzaImage.backgroundColor = .darkGray
        self.layer.cornerRadius = 15
        self.pizzaImage.layer.cornerRadius = 15
    }
    
    private func setupConstraints() {
        let lateral: CGFloat = 15
        NSLayoutConstraint.activate([
            self.pizzaImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.pizzaImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.pizzaImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.pizzaImage.widthAnchor.constraint(equalToConstant: (contentView.frame.width/3)),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: lateral),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.pizzaImage.trailingAnchor, constant: 10),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -lateral),
            
            self.valueLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            self.valueLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
        ])
    }
    
    
}
