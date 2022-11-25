import Foundation
import UIKit

class MVPPerfilDelegate: NSObject, UICollectionViewDelegate {
    // Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print(indexPath.row)
    }
    
}
