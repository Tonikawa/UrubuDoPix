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
    
    static func newView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    static func newCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white

        
        return cv
    }
    
    static func newScrollView() -> UIScrollView {
        let scroll = UIScrollView(frame: .zero)
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        
        return scroll
    }
    
    static func newImage() -> UIImageView {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.clipsToBounds = true
        
        return imgV
    }
    
    static func newButton() -> CustomButton {
        let but = CustomButton()
        //but.tintColor = .white
        
        return but
    }
    
    static func newSegmentation(with itens: [String]?) -> UISegmentedControl {
        var seg = UISegmentedControl()
        
        if let itens = itens {
            seg = UISegmentedControl(items: itens)
            seg.selectedSegmentTintColor = .white
            seg.backgroundColor = .lightGray
        }
    
        seg.translatesAutoresizingMaskIntoConstraints = false
        return seg
    }
    
    static func newSearch() -> UISearchBar {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        
        // Cores
            //let textColor = UIColor(
        
        search.backgroundImage = UIImage()
        search.searchTextField.backgroundColor = .lightGray
        search.searchTextField.textColor = .black
        search.searchTextField.setupPlaceHolder(text: "Buscar", color: .gray)
        search.searchTextField.setupIconsColor(with: .gray)
        
        return search
    }
}

