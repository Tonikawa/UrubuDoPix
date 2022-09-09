//
//  CustomViews.swift
//  MVPEsmeralda
//
//  Created by Gabriel Batista on 08/09/22.
//

import Foundation
import UIKit

class CustomViews {
    static func newLabel() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //lbl.backgroundColor = .blue
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.layer.masksToBounds = true
        
        return lbl
    }
    
    static func newCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false

        
        return cv
    }
    
    static func newScrollView() -> UIScrollView {
        let scroll = UIScrollView(frame: .zero)
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        
        return scroll
    }
}

