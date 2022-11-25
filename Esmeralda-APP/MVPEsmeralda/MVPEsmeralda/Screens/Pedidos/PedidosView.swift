
import UIKit

class PedidosView: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    
    let pedidosTitle = CustomViews.newLabel()
    
    let pedidosCollection: UICollectionView = CustomViews.newCollectionView()
    
    let backButton: UIButton = {
        let button = CustomViews.newButton()
        button.setTitle("Voltar", for: .normal)
        button.isCircular = false
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    // Outros
    
    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
    
    
    /// Configurações do layout da collection
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .vertical
        
        return cvFlow
    }()
    
    
    
    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        
        self.setupViews()
        self.registerCell()
        self.setupCollectionFlow()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */
    
    /* Ações dos Botões */
    
    /// Define a ação do botão
    public func setAction(target: Any?, action: Selector) -> Void {
        // self. .addTarget(target, action: action, for: .touchDown)
    }
    
    
    
    /* MARK: - Ciclo de Vida */
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.setupUI()
        self.setupStaticTexts()
        self.setupDynamicConstraints()
    }
    
    
    
    /* MARK: - Configurações */
    
    /* Collection */
    
    /// Registra as células nas collections/table
    private func registerCell() {
        pedidosCollection.register(PedidosViewCell.self, forCellWithReuseIdentifier: PedidosViewCell.identifier)
    }
    
    
    /// Define o layout da collection
    private func setupCollectionFlow() {
         pedidosCollection.collectionViewLayout = self.collectionFlow
    }
    
    
    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(pedidosTitle)
        self.addSubview(pedidosCollection)
        self.addSubview(backButton)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.backgroundColor = .white
        self.pedidosCollection.backgroundColor = .clear
        // Define o tamanho que a célula vai ter
        self.collectionFlow.itemSize = CGSize(width: 340, height: 130)
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {
        self.pedidosTitle.setupText(info: LabelInfo(text: "Pedidos", size: 28, weight: .bold))
    }
    
    public func setButtonAction(target: Any?, action: Selector) -> Void {
        self.backButton.addTarget(target, action: action, for: .touchDown)
    }
    
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
         let lateral: CGFloat = 15
        // let between: CGFloat =
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        self.dynamicConstraints = [
            self.backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            self.backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            
            self.pedidosTitle.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            self.pedidosTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.pedidosTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            
            self.pedidosCollection.topAnchor.constraint(equalTo: self.pedidosTitle.bottomAnchor, constant: lateral),
            self.pedidosCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.pedidosCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.pedidosCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
