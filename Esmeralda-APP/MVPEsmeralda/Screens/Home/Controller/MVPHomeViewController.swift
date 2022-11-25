/* Grupo - UrubuDoPIX */

/* Bibliotecas necessárias: */
import UIKit


/// Controller responsável POR
class MVPHomeViewController: UIViewController {
    
    /* MARK: - Atributos */
    /*
        Implementação das variáveis (atributos) da classe.

        AVISO: Apague esse campo de comentário
    */
    
    /* View */

    /// View principal que a classe vai controlar
     private let myView = MVPHomeView()
    
    
    /* Delegate & Data Sources */


        
    /* MARK: - Ciclo de Vida */
    
    override func loadView() {
         self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigation()
        self.setupDelegates()
        self.setupButtonsAction()
    }
    


    /* MARK: - Protocolo */
    /*
        Implementação das funções do protocolo que a controller está herdando.

        AVISO: Apague esse campo de comentário.
    */
    
    

    /* MARK: - Ações de botões */
    /*
        Implementação das funções de ações dos botões. Todas as funções que estão
        nessa área do mark devem ter o @objc apenas.

        AVISO: Apague esse campo de comentário.
    */
    
    
    
    /* MARK: - Configurações */
    /*
        Funções responsáveis por fazer configurações gerais.

        AVISO: Apague esse campo de comentário.
    */

    /// Configurções da navigation
    private func setupNavigation() {
    
    }

    
    /// Definindo as ações dos botões
    private func setupButtonsAction() {
      
    }
    
    
    /// Definindo os delegates, data sources e protocolos
    private func setupDelegates() {
    
    }
}
