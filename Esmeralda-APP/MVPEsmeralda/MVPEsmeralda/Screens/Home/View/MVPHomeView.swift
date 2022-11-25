/* Grupo - UrubuDoPIX */

/* Bibliotecas necessárias: */
import UIKit

class MVPHomeView: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    let promotionsCollection: UICollectionView = CustomViews.newCollectionView()
    let ordersCollection: UICollectionView = CustomViews.newCollectionView()
    let favoriteCollection: UICollectionView = CustomViews.newCollectionView()
    let myscrollview: UIScrollView = CustomViews.newScrollView()
    
    public let promotionsTitle: UILabel = CustomViews.newLabel()
    let ordersTitle: UILabel = CustomViews.newLabel()
    let favoriteTitle: UILabel = CustomViews.newLabel()
    
    // Outros
    
    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
    
    
    /// Configurações do layout da collection
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .horizontal
        cvFlow.itemSize = CGSize(width: 150, height: 150)
        
        return cvFlow
    }()
    
    private let collectionFlow2: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .horizontal
        cvFlow.itemSize = CGSize(width: 150, height: 150)
        
        return cvFlow
    }()
    
    private let collectionFlow3: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .horizontal
        cvFlow.itemSize = CGSize(width: 150, height: 150)
        
        return cvFlow
    }()
    
    let viewButton: UIButton = {
        let button = CustomViews.newButton()
        button.setTitle("Ver todos", for: .normal)
        button.isCircular = false
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    
    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        self.setupViews()
        self.registerCell()
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
        promotionsCollection.register(MVPHomeCell.self, forCellWithReuseIdentifier: MVPHomeCell.identifier)
        ordersCollection.register(MVPHomeCell.self, forCellWithReuseIdentifier: MVPHomeCell.identifier)
        favoriteCollection.register(MVPHomeCell.self, forCellWithReuseIdentifier: MVPHomeCell.identifier)
    }
    
    
    /// Define o layout da collection
    private func setupCollectionFlow() {
        self.promotionsCollection.collectionViewLayout = self.collectionFlow
        self.ordersCollection.collectionViewLayout = self.collectionFlow2
        self.favoriteCollection.collectionViewLayout = self.collectionFlow3
    }
    
    
    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        
        self.addSubview(myscrollview)
        self.myscrollview.addSubview(promotionsTitle)
        self.myscrollview.addSubview(promotionsCollection)
        self.myscrollview.addSubview(ordersTitle)
        self.myscrollview.addSubview(ordersCollection)
        self.myscrollview.addSubview(favoriteTitle)
        self.myscrollview.addSubview(favoriteCollection)
        self.myscrollview.addSubview(viewButton)
    }
    
    public func setButtonAction(target: Any?, action: Selector) -> Void {
        self.viewButton.addTarget(target, action: action, for: .touchDown)
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
        let lateral: CGFloat = self.bounds.width * 0.02
        let between: CGFloat = 5
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        self.dynamicConstraints = [
            self.myscrollview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.myscrollview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.myscrollview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.myscrollview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.promotionsTitle.topAnchor.constraint(equalTo: myscrollview.topAnchor, constant: 30),
            self.promotionsTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.promotionsTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.promotionsTitle.heightAnchor.constraint(equalToConstant: 50),
            
            self.promotionsCollection.topAnchor.constraint(equalTo: promotionsTitle.bottomAnchor, constant: between),
            self.promotionsCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.promotionsCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.promotionsCollection.heightAnchor.constraint(equalToConstant: 200),
            
            self.favoriteTitle.topAnchor.constraint(equalTo: promotionsCollection.bottomAnchor, constant: 15),
            self.favoriteTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.favoriteTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.favoriteTitle.heightAnchor.constraint(equalToConstant: 50),
            
            self.viewButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.viewButton.heightAnchor.constraint(equalToConstant: 40),
            self.viewButton.widthAnchor.constraint(equalToConstant: 80),
            self.viewButton.centerYAnchor.constraint(equalTo: ordersTitle.centerYAnchor),
            
            self.favoriteCollection.topAnchor.constraint(equalTo: favoriteTitle.bottomAnchor, constant: between),
            self.favoriteCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.favoriteCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.favoriteCollection.heightAnchor.constraint(equalToConstant: 200),
            
            self.ordersTitle.topAnchor.constraint(equalTo: favoriteCollection.bottomAnchor, constant: 15),
            self.ordersTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.ordersTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.ordersTitle.heightAnchor.constraint(equalToConstant: 50),
            
            self.ordersCollection.topAnchor.constraint(equalTo: ordersTitle.bottomAnchor, constant: between),
            self.ordersCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.ordersCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.ordersCollection.heightAnchor.constraint(equalToConstant: 200),
            self.ordersCollection.bottomAnchor.constraint(equalTo: myscrollview.bottomAnchor, constant: -30)
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
