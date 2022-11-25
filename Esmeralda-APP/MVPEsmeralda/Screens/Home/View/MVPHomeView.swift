/* Grupo - UrubuDoPIX */

/* Bibliotecas necessárias: */
import UIKit

class MVPHomeView: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    let promotionsCollection: UICollectionView = CustomViews.newCollectionView()
    let ordersCollection: UICollectionView = CustomViews.newCollectionView()
    let favoriteCollection: UICollectionView = CustomViews.newCollectionView()
    
    public let promotionsTitle: UILabel = CustomViews.newLabel()
    let ordersTitle: UILabel = CustomViews.newLabel()
    let favoriteTitle: UILabel = CustomViews.newLabel()
    //let favortieButton = CustomViews.newButton()
    
    // Outros
    
    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
    
    
    /// Configurações do layout da collection
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .horizontal
        
        return cvFlow
    }()
    
    
    
    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        self.setupViews()
        //self.registerCells()
        self.setupCollectionFlow()
        self.setupStaticTexts()
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
        
    }
    
    
    /// Define o layout da collection
    private func setupCollectionFlow() {
        // self.collection.collectionViewLayout = self.collectionFlow
    }
    
    
    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
  
        self.addSubview(promotionsTitle)
        self.addSubview(promotionsCollection)
        self.addSubview(ordersTitle)
        self.addSubview(ordersCollection)
        self.addSubview(favoriteTitle)
        self.addSubview(favoriteCollection)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        /*
         Aqui vão definidos as bordas, cor de fundo da view
         */
        
        // Define o tamanho que a célula vai ter
        // self.collectionFlow.itemSize = CGSize(width: 100, height: 100)
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {
        /*
         Aqui vão ser configurados os textos estáticos, ícones dos botões
         tamanho das fontes, peso das fontes.. (para botões e labels ou até
         mesmo para putrp elemento caso tenha)
         */
        
        /* Labels */
        self.promotionsTitle.setupTitle(info: LabelInfo(text: "Promoções", size: 28, weight: .semibold))
        self.ordersTitle.setupTitle(info: LabelInfo(text: "Últimos Pedidos", size: 28, weight: .semibold))
        self.favoriteTitle.setupTitle(info: LabelInfo(text: "Favoritos", size: 28, weight: .semibold))
        
        /* Botões */
    }
    
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
        let lateral: CGFloat = self.bounds.width * 0.05
        let between: CGFloat = 10
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        self.dynamicConstraints = [
            self.promotionsTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            self.promotionsTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.promotionsTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.promotionsTitle.heightAnchor.constraint(equalToConstant: 60),
            
            self.promotionsCollection.topAnchor.constraint(equalTo: promotionsTitle.bottomAnchor, constant: between),
            self.promotionsCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.promotionsCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.promotionsCollection.heightAnchor.constraint(equalToConstant: 200),
            
            self.favoriteTitle.topAnchor.constraint(equalTo: promotionsCollection.bottomAnchor, constant: 20),
            self.favoriteTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.favoriteTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.favoriteTitle.heightAnchor.constraint(equalToConstant: 60),
            
            self.favoriteCollection.topAnchor.constraint(equalTo: favoriteTitle.bottomAnchor, constant: between),
            self.favoriteCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.favoriteCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.favoriteCollection.heightAnchor.constraint(equalToConstant: 200),
            
            self.ordersTitle.topAnchor.constraint(equalTo: favoriteCollection.bottomAnchor, constant: 20),
            self.ordersTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.ordersTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.ordersTitle.heightAnchor.constraint(equalToConstant: 60),
            
            self.ordersCollection.topAnchor.constraint(equalTo: ordersTitle.bottomAnchor, constant: between),
            self.ordersCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.ordersCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.ordersCollection.heightAnchor.constraint(equalToConstant: 200),
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
