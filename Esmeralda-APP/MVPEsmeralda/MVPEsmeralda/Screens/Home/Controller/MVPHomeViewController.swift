/* Grupo - UrubuDoPIX */

/* Bibliotecas necessárias: */
import UIKit


/// Controller responsável POR
class MVPHomeViewController: UIViewController, ViewControllerProtocol {
    
    
    
    /* MARK: - Atributos */
    /*
        Implementação das variáveis (atributos) da classe.

        AVISO: Apague esse campo de comentário
    */
    
    /* View */

    /// View principal que a classe vai controlar
     private let myView = MVPHomeView()
    
    
    /* Delegate & Data Sources */
    let collectionDelegate = MVPHomeDelegate()
    let collectionDataSource = MVPHomeDataSource()

        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.collectionDelegate.delegateViewController = self
        self.collectionDataSource.delegateViewController = self
        
        self.myView.promotionsCollection.dataSource = collectionDataSource
        self.myView.promotionsCollection.delegate = collectionDelegate
        
        self.myView.ordersCollection.dataSource = collectionDataSource
        self.myView.ordersCollection.delegate = collectionDelegate
        
        self.myView.favoriteCollection.dataSource = collectionDataSource
        self.myView.favoriteCollection.delegate = collectionDelegate
    }

    /* MARK: - Protocolo */
    
     func getData() -> Int {
         return 5
     }
     
    
    
    

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
    
    
    /// Definindo os delegates, data sources e protocolos
    private func setupDelegates() {
    
    }
    
    @objc
    private func backAction() {
        let controller = PedidosViewController()
        controller.modalPresentationStyle = .fullScreen
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func setupButtonsAction() {
        self.myView.setButtonAction(target: self, action: #selector(self.backAction))
    }
    
    
}
