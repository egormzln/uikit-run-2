//
//  ViewController.swift
//  UiKitRun2
//
//  Created by Егор Мизюлин on 06.11.2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var firstButton: UIButton = CustomButton()
    lazy var secondButton: UIButton = CustomButton()
    lazy var thirdButton: UIButton = CustomButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        for item in [firstButton, secondButton, thirdButton] {
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }

        firstButton.setTitle("First Button", for: .normal)
        secondButton.setTitle("Second Medium Button", for: .normal)
        thirdButton.setTitle("Third", for: .normal)
        thirdButton.addTarget(self, action: #selector(thirdButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 8),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 8),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        view.backgroundColor = .systemBackground
    }

    @objc private func thirdButtonTapped() {
        let modalViewController = ModalViewController()
        modalViewController.modalPresentationStyle = .formSheet
        present(modalViewController, animated: true)
    }
}

class CustomButton: UIButton {
    private var buttonAnimator: UIViewPropertyAnimator?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()

        switch tintAdjustmentMode {
            case .dimmed:
                backgroundColor = .systemGray2
                imageView?.tintColor = .systemGray3
                titleLabel?.textColor = .systemGray3
            default:
                backgroundColor = .systemBlue
                imageView?.tintColor = .white
                titleLabel?.textColor = .white
        }
    }

    func setup() {
        configuration = .borderedProminent()
        configuration?.baseBackgroundColor = .systemBlue
        configuration?.background.cornerRadius = 12
        configuration?.titleAlignment = .center
        configuration?.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration?.image = UIImage(systemName: "arrow.forward.circle.fill")
        configuration?.imagePadding = 8
        configuration?.imagePlacement = .trailing
        addTarget(self, action: #selector(buttonPressed), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside, .touchCancel, .touchDragExit])
        layer.cornerRadius = 12
    }

    @objc private func buttonPressed() {
        buttonAnimator?.stopAnimation(true)

        buttonAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
        buttonAnimator?.startAnimation()
    }

    @objc private func buttonReleased() {
        buttonAnimator?.stopAnimation(true)

        buttonAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn) {
            self.transform = .identity
        }

        buttonAnimator?.startAnimation()
    }
}
