//
//  MVPHomeDataSource.swift
//  MVPEsmeralda
//
//  Created by Gabriel Batista on 09/09/22.
//

import Foundation
import UIKit

class MVPHomeDataSource: NSObject, UICollectionViewDataSource {
    // Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let delegate = delegateViewController {
            return delegate.getData()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MVPHomeCell.identifier, for: indexPath) as? MVPHomeCell else {
            return UICollectionViewCell()
        }
//        if let delegate = delegateViewController {
//            cell.setText(text: delegate.getData()[indexPath.row])
//        }
        
        return cell
    }
}


