
import UIKit


/// Controller responsável POR
class PizzaViewController: UIViewController {
    
    /* MARK: - Atributos */
    /*
        Implementação das variáveis (atributos) da classe.

        AVISO: Apague esse campo de comentário
    */
    
    /* View */

    /// View principal que a classe vai controlar
     private let myView = PizzaView()
    
    
    /* Delegate & Data Sources */
//    let collectionDelegate = MVPPedidosDelegate()
//    let collectionDataSource = MVPPedidosDataSource()

        
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

    
    @objc
    private func backAction() {
        self.navigationController?.popViewController(animated: true)
        print("clicou")
    }
    
    private func setupButtonsAction() {
        self.myView.setButtonAction(target: self, action: #selector(self.backAction))
    }
    
    /// Definindo os delegates, data sources e protocolos
    private func setupDelegates() {
//        self.collectionDelegate.delegateViewController = self
//        self.collectionDataSource.delegateViewController = self
//
//        self.myView.pedidosCollection.delegate = collectionDelegate
//        self.myView.pedidosCollection.dataSource = collectionDataSource
    }
    
    
}
