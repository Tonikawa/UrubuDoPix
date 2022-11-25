//
//  MVPHomeDelegate.swift
//  MVPEsmeralda
//
//  Created by Gabriel Batista on 09/09/22.
//

import Foundation
import UIKit

class MVPHomeDelegate: NSObject, UICollectionViewDelegate {
    // Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print(indexPath.row)
    }
    
}
