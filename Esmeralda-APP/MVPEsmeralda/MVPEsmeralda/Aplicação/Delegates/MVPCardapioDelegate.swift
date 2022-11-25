/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Delegate da collection de mostrar os alimentos
class MVPCardapioDelegate: NSObject, UICollectionViewDelegate {
    
    /* MARK: - Atributos */
    
    /// Comunicação entre o delegate com a controller
    private weak var pizzaProtocol: PizzaProtocol?
        

    
    /* MARK: - Encapsulamento */
    
    /// Define qual vai ser o protocolo do delegate
    /// - Parameter protocol: protocolo de comunicação
    public func setProtocol(with delegate: PizzaProtocol) {
        self.pizzaProtocol = delegate
    }
    
    
    
    /* MARK: - Delegate */
    
    /// Ação de quando clica em uma célula
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.pizzaProtocol?.openFoodInfo(for: indexPath.row)
    }
}
