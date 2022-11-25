
import UIKit

class MVPCardapioView: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    
    let cardapioCollection: UICollectionView = CustomViews.newCollectionView()
    let cardapioSegmented: UISegmentedControl = CustomViews.newSegmentation(with: ["Queijo", "Frango", "Calabresa", "Atum", "Veggie"])
    let cardapioSearchBar: UISearchBar = CustomViews.newSearch()
    let cardapioTitle: UILabel = CustomViews.newLabel()
    
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
        cardapioCollection.register(MVPCardapioCell.self, forCellWithReuseIdentifier: MVPCardapioCell.identifier)
    }
    
    
    /// Define o layout da collection
    private func setupCollectionFlow() {
        self.cardapioCollection.collectionViewLayout = self.collectionFlow
    }
    
    
    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(cardapioSegmented)
        self.addSubview(cardapioCollection)
        self.addSubview(cardapioSearchBar)
        self.addSubview(cardapioTitle)
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
        self.cardapioTitle.setupTitle(info: LabelInfo(text: "Cardápio", size: 28, weight: .semibold))
        
        /* Botões */
    }
    
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
         let lateral: CGFloat = 15
         let between: CGFloat = 20
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        self.dynamicConstraints = [
            self.cardapioTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            self.cardapioTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.cardapioTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            
            self.cardapioSearchBar.topAnchor.constraint(equalTo: cardapioTitle.bottomAnchor, constant: between),
            self.cardapioSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            self.cardapioSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            self.cardapioSearchBar.heightAnchor.constraint(equalToConstant: 35),
            
            self.cardapioSegmented.topAnchor.constraint(equalTo: cardapioSearchBar.bottomAnchor, constant: between),
            self.cardapioSegmented.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.cardapioSegmented.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.cardapioSegmented.heightAnchor.constraint(equalToConstant: 30),
            
            self.cardapioCollection.topAnchor.constraint(equalTo: cardapioSegmented.bottomAnchor, constant: between),
            self.cardapioCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.cardapioCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.cardapioCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
