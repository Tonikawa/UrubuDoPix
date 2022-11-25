
import UIKit

class PizzaView: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    
    let pizzaTitle = CustomViews.newLabel()
    
    let pizzaDescription = {
        let lbl = CustomViews.newLabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 3
        
        return lbl
    }()
    
    let pizzaiImage = CustomViews.newImage()
    
    let addButton: UIButton = {
        let button = CustomViews.newButton()
        button.setTitle("Adicionar", for: .normal)
        button.isCircular = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        
        return button
    }()
    
    let simpleTextField: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.placeholder = "Observações"
        txt.textAlignment = .left
        txt.font = UIFont.systemFont(ofSize: 15)
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.translatesAutoresizingMaskIntoConstraints = false

        return txt
    }()
    
    let backButton: UIButton = {
        let button = CustomViews.newButton()
        button.setTitle("Voltar", for: .normal)
        button.isCircular = false
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    let myscrollview: UIScrollView = CustomViews.newScrollView()
    
    // Outros
    
    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
    
    
    
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
        //        pedidosCollection.register(PedidosViewCell.self, forCellWithReuseIdentifier: PedidosViewCell.identifier)
    }
    
    
    /// Define o layout da collection
    private func setupCollectionFlow() {
        //         pedidosCollection.collectionViewLayout = self.collectionFlow
    }
    
    
    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(myscrollview)
        self.myscrollview.addSubview(pizzaiImage)
        self.myscrollview.addSubview(pizzaTitle)
        self.myscrollview.addSubview(pizzaDescription)
        self.myscrollview.addSubview(simpleTextField)
        self.myscrollview.addSubview(addButton)
        self.myscrollview.addSubview(backButton)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.backgroundColor = .white
        self.myscrollview.backgroundColor = .clear
        self.pizzaiImage.backgroundColor = .darkGray
        self.addButton.layer.cornerRadius = 5
        self.simpleTextField.layer.cornerRadius = 15
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {
        self.pizzaTitle.setupText(info: LabelInfo(text: "Nome da Pizza", size: 28, weight: .bold))
        
        self.pizzaDescription.setupText(info: LabelInfo(text: "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum", size: 17, weight: .regular))
    }
    
    public func setButtonAction(target: Any?, action: Selector) -> Void {
        self.addButton.addTarget(target, action: action, for: .touchDown)
        self.backButton.addTarget(target, action: action, for: .touchDown)
    }
    
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
        let lateral: CGFloat = 15
        // let between: CGFloat =
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        self.dynamicConstraints = [
            self.myscrollview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.myscrollview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.myscrollview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.myscrollview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            self.backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            
            self.pizzaiImage.topAnchor.constraint(equalTo: self.myscrollview.topAnchor),
            self.pizzaiImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.pizzaiImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.pizzaiImage.heightAnchor.constraint(equalToConstant: 300),
            
            self.pizzaTitle.topAnchor.constraint(equalTo: self.pizzaiImage.bottomAnchor, constant: lateral),
            self.pizzaTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            
            self.pizzaDescription.topAnchor.constraint(equalTo: self.pizzaTitle.bottomAnchor, constant: 10),
            self.pizzaDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.pizzaDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            
            self.simpleTextField.topAnchor.constraint(equalTo: self.pizzaDescription.bottomAnchor, constant: lateral),
            self.simpleTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.simpleTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.simpleTextField.heightAnchor.constraint(equalToConstant: 100),
            
            self.addButton.topAnchor.constraint(equalTo: self.simpleTextField.bottomAnchor, constant: lateral),
            self.addButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.addButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.addButton.heightAnchor.constraint(equalToConstant: 40),
            
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
