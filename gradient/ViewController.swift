//
//  ViewController.swift
//  gradient
//
//  Created by Илья Мудрый on 01.07.2023.
//

import UIKit

final class ViewController: UIViewController {
	
	// MARK: Variables

	private let colors = [
		UIColor(red: 20/225, green: 122/255, blue: 219/225, alpha: 1.0).cgColor,
		UIColor(red: 94/225, green: 188/255, blue: 99/225, alpha: 1.0).cgColor,
		UIColor(red: 236/225, green: 229/255, blue: 54/225, alpha: 1.0).cgColor
	]
	
	private lazy var square = GradientView(colors: colors)
	
	// MARK: Life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		setupSquare()
		bonus()
	}
}

// MARK: - Private

private extension ViewController {
	
	/// Добавить квадтраную`view`.
	func setupSquare() {
		square.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(square)

		NSLayoutConstraint.activate([
			square.heightAnchor.constraint(equalToConstant: 100.0),
			square.widthAnchor.constraint(equalTo: square.heightAnchor, multiplier: 1.0),
			square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			square.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100.0)
		])
	}
	
	/// Бонус 😁.
	func bonus() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bonusAction))
		square.addGestureRecognizer(tapGesture)
	}
	
	/// Обработать нажатие.
	@objc func bonusAction() {
		square.showBonus()
	}
}
