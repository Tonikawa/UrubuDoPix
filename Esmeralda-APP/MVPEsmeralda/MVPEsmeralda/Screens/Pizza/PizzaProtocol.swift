/* Bibliotecas necessárias: */
import UIKit


/// Os tipos que estão de acordo com esse protocolo faz com que a tela de info de alimentos apareça
protocol PizzaProtocol: NSObject {
    
    /// Abre a tela de informa;cões de alimento
    /// - Parameter index: célula que foi aberta
    func openFoodInfo(for index: Int)
}
