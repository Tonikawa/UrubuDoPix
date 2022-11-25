
import UIKit

class FavoriteView: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    
    let favoriteCollection: UICollectionView = CustomViews.newCollectionView()
    let favoriteSegmented: UISegmentedControl = CustomViews.newSegmentation(with: ["Queijo", "Frango", "Calabresa", "Atum", "Veggie"])
    let favoriteSearchBar: UISearchBar = CustomViews.newSearch()
    let favoriteTitle: UILabel = CustomViews.newLabel()
    
    
    
    // Outros
    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
    
    
    /// Configurações do layout da collection
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .vertical
        cvFlow.itemSize = CGSize(width: 170, height: 170)
        
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
        favoriteCollection.register(FavoriteViewCell.self, forCellWithReuseIdentifier: FavoriteViewCell.identifier)
    }
    
    
    /// Define o layout da collection
    private func setupCollectionFlow() {
        self.favoriteCollection.collectionViewLayout = self.collectionFlow
    }
    
    
    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(favoriteSegmented)
        self.addSubview(favoriteCollection)
        self.addSubview(favoriteSearchBar)
        self.addSubview(favoriteTitle)
        /*
         Aqui vão adicionar os elementos na tela (.addSubViews())
         */
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.backgroundColor = .white
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
        self.favoriteTitle.setupTitle(info: LabelInfo(text: "Favoritos", size: 28, weight: .semibold))
        
        /* Botões */
    }
    
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
         let lateral: CGFloat = 15
         let between: CGFloat = 20
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        self.dynamicConstraints = [
            self.favoriteTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            self.favoriteTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.favoriteTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            
            self.favoriteSearchBar.topAnchor.constraint(equalTo: favoriteTitle.bottomAnchor, constant: between),
            self.favoriteSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            self.favoriteSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            self.favoriteSearchBar.heightAnchor.constraint(equalToConstant: 35),
            
            self.favoriteSegmented.topAnchor.constraint(equalTo: favoriteSearchBar.bottomAnchor, constant: between),
            self.favoriteSegmented.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.favoriteSegmented.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.favoriteSegmented.heightAnchor.constraint(equalToConstant: 30),
            
            self.favoriteCollection.topAnchor.constraint(equalTo: favoriteSegmented.bottomAnchor, constant: between),
            self.favoriteCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.favoriteCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.favoriteCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
