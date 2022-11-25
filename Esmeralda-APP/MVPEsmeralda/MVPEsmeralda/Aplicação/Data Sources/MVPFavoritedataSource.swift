//
//  MVPCardapioDataSource.swift
//  MVPEsmeralda
//
//  Created by Gabriel Batista on 16/09/22.
//

import Foundation
import UIKit

class MVPFavoritedataSource: NSObject, UICollectionViewDataSource {
    // Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let delegate = delegateViewController {
            return delegate.getData()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteViewCell.identifier, for: indexPath) as? FavoriteViewCell else {
            return UICollectionViewCell()
        }

        
        return cell
    }
}
