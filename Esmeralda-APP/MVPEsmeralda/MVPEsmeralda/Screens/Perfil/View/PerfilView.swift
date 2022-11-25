/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit

class PerfilView: UIView {
    
    /* MARK: - Atributos */
    
    let titleLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        
        return lbl
    }()
    
    let profileImage: UIImageView = {
        let img = CustomViews.newImage()
        img.backgroundColor = .red

        
        return img
    }()
    
    let editButton: UIButton = {
        let button = CustomViews.newButton()
        button.setTitle("Editar", for: .normal)
        button.isCircular = false
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    let userNameLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    let telephoneLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    let adressLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        
        return lbl
    }()
    
    let adressCollection: UICollectionView = {
        let col = CustomViews.newCollectionView()
        col.backgroundColor = .clear
        
        return col
    }()
    
    let scrollView: UIScrollView = CustomViews.newScrollView()
    
    let contactButton: UIButton = {
        let button = CustomViews.newButton()
        button.setTitle("Contato", for: .normal)
        button.isCircular = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    let imgHeight: CGFloat = 100
    // Views
    
    
    // Outros
    
    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
    
    
    /// Configurações do layout da collection
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .vertical
        cvFlow.itemSize = CGSize(width: 350, height: 110)
        
        return cvFlow
    }()
    
    
    
    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        
        self.setupViews()
        self.registerCell()
        self.setupCollectionFlow()
        self.backgroundColor = .white
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
        adressCollection.register(PerfilViewCell.self, forCellWithReuseIdentifier: PerfilViewCell.identifier)
    }
    
    
    /// Define o layout da collection
    private func setupCollectionFlow() {
         self.adressCollection.collectionViewLayout = self.collectionFlow
    }
    
    
    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(scrollView)
        self.scrollView.addSubview(titleLabel)
        self.scrollView.addSubview(editButton)
        self.scrollView.addSubview(profileImage)
        self.scrollView.addSubview(userNameLabel)
        self.scrollView.addSubview(telephoneLabel)
        self.scrollView.addSubview(adressLabel)
        self.scrollView.addSubview(adressCollection)
        self.scrollView.addSubview(contactButton)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        profileImage.layer.cornerRadius = self.imgHeight/2
        contactButton.layer.cornerRadius = 5
        
        let setImage = "usuario"
        let image = UIImage(named: setImage)
        self.profileImage.image = image
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {
        titleLabel.setupText(info: LabelInfo(text: "Perfil", size: 32, weight: .bold))
        userNameLabel.setupText(info: LabelInfo(text: "Usuário", size: 17, weight: .medium))
        telephoneLabel.setupText(info: LabelInfo(text: "(xx) xxxxx-xxxx", size: 17, weight: .regular))
        adressLabel.setupText(info: LabelInfo(text: "Endereços salvos", size: 25, weight: .semibold))
    }
    
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
         let lateral: CGFloat = 16
         let imgWidth: CGFloat = 100
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        self.dynamicConstraints = [
            self.scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            titleLabel.widthAnchor.constraint(equalToConstant: 140),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            editButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            editButton.widthAnchor.constraint(equalToConstant: 100),
            editButton.heightAnchor.constraint(equalToConstant: 40),
            editButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            
            profileImage.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 50),
            profileImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: imgWidth),
            profileImage.heightAnchor.constraint(equalToConstant: self.imgHeight),
           
            userNameLabel.topAnchor.constraint(equalTo: self.profileImage.bottomAnchor, constant: 20),
            userNameLabel.widthAnchor.constraint(equalToConstant: 100),
            userNameLabel.heightAnchor.constraint(equalToConstant: 30),
            userNameLabel.centerXAnchor.constraint(equalTo: self.profileImage.centerXAnchor),
            
            telephoneLabel.topAnchor.constraint(equalTo: self.userNameLabel.bottomAnchor, constant: 10),
            telephoneLabel.widthAnchor.constraint(equalToConstant: 150),
            telephoneLabel.heightAnchor.constraint(equalToConstant: 30),
            telephoneLabel.centerXAnchor.constraint(equalTo: self.profileImage.centerXAnchor),
            
            adressLabel.topAnchor.constraint(equalTo: self.telephoneLabel.bottomAnchor, constant: 30),
            adressLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            adressLabel.widthAnchor.constraint(equalToConstant: 200),
            adressLabel.heightAnchor.constraint(equalToConstant: 40),
            
            adressCollection.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20),
            adressCollection.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            adressCollection.trailingAnchor.constraint(equalTo: editButton.trailingAnchor),
            adressCollection.heightAnchor.constraint(equalToConstant: 310),
            
            contactButton.topAnchor.constraint(equalTo: adressCollection.bottomAnchor, constant: 20),
            contactButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contactButton.widthAnchor.constraint(equalToConstant: 150),
            contactButton.heightAnchor.constraint(equalToConstant: 40),
            
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
