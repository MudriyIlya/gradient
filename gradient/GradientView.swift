//
//  GradientView.swift
//  gradient
//
//  Created by Илья Мудрый on 01.07.2023.
//

import UIKit

/// `View`c  градиентом.
final class GradientView: UIView {
	
	// MARK: Variables
	
	private var colors: [CGColor]?
	
	private let gradient: CAGradientLayer = {
		let gradient = CAGradientLayer()
		gradient.type = .axial
		gradient.startPoint = CGPoint(x: 1, y: 0)
		gradient.endPoint = CGPoint(x: 0, y: 1)
		return gradient
	}()
	
	private let imageView: UIImageView = {
		let image = UIImage(named: "cat")
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.alpha = 0
		return imageView
	}()
	
	// MARK: Initializers
	
	/// Инициализатор.
	/// - Parameter colors: массив с набором цветов градиента.
	convenience init(colors: [CGColor]) {
		self.init(frame: .zero)
		self.colors = colors
		setupGradientAndCorners()
		setupShadow()
		addCat()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupGradientAndCorners()
		setupShadow()
		addCat()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Public func
	
	override func layoutSubviews() {
		super.layoutSubviews()
		gradient.frame = layer.bounds
	}
	
	/// Показать бонус.
	func showBonus() {
		if imageView.alpha != 1 {
			UIView.animate(withDuration: 0.2) { [weak self] in
				self?.imageView.alpha = 1
			}
		} else {
			UIView.animate(withDuration: 0.2) { [weak self] in
				self?.imageView.alpha = 0
			}
		}
	}
}

// MARK: - Private

private extension GradientView {
	
	/// Скруглить углы.
	func setupGradientAndCorners() {
		gradient.colors = colors
		gradient.cornerRadius = 20.0
		gradient.cornerCurve = .continuous
		layer.addSublayer(gradient)
	}
	
	/// Установить тень.
	func setupShadow() {
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOpacity = 0.7
		layer.shadowRadius = 3
		layer.shadowOffset = CGSize(width: 0, height: 0)
	}
	
	/// Добавить пасхалку.
	func addCat() {
		addSubview(imageView)
		NSLayoutConstraint.activate([
			imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
			imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0),
			imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}
}
