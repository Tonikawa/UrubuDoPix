/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Cria uma scroll view e já configura ela de acordo com o tamanho que vai ser definido pra ela
class CustomScroll: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    
    /// Scrool view padrão do UIKit
    public let scroll: UIScrollView = {
        let scrool = UIScrollView()
        scrool.translatesAutoresizingMaskIntoConstraints = false
        scrool.backgroundColor = .clear
        return scrool
    }()
    
    /// Espaço para colocar os elementos na scroll
    public let contentView: UIView = {
        let view = CustomViews.newView()
        return view
    }()
    
    
    // Outros
    
    /// Tamanho da scrollView
    public var scrollContentSize = CGSize() {
        didSet {
            self.setupScroollSize()
        }
    }
    
    /// Constraints dinâmicas que mudam de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []



    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    

    
    /* MARK: - Ciclo de Vida */
    
    override public func layoutSubviews() {
        super.layoutSubviews()
          
        self.setupDynamicConstraints()
        self.setupScroollSize()
    }
    
    
    
    /* MARK: - Configurações */
    
    /// Configura o tamanho da scroll e a contentView dela
    private func setupScroollSize() {
        self.scroll.frame = self.bounds
        self.scroll.contentSize = self.scrollContentSize
        
        self.contentView.frame.size = self.scrollContentSize
    }
    
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(self.scroll)
        self.scroll.addSubview(self.contentView)
    }
          
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
        let safeAreaTop = self.scroll.safeAreaInsets.top
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        self.dynamicConstraints = [
            self.scroll.topAnchor.constraint(equalTo: self.topAnchor),
            self.scroll.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.scroll.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.scroll.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.scroll.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            
            self.contentView.topAnchor.constraint(equalTo: self.scroll.topAnchor, constant: -safeAreaTop),
            self.contentView.leftAnchor.constraint(equalTo: self.scroll.leftAnchor),
            self.contentView.rightAnchor.constraint(equalTo: self.scroll.rightAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scroll.widthAnchor),
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
