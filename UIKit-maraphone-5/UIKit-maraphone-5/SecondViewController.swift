import UIKit

class SecondViewController: UIViewController {
    private let closeButton = UIButton()
    private let switcher = UISegmentedControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        switcher.insertSegment(withTitle: "280pt", at: 0, animated: false)
        switcher.insertSegment(withTitle: "150pt", at: 1, animated: false)
        switcher.selectedSegmentIndex = 0
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        switcher.addTarget(self, action: #selector(switherSegmentChanged), for: .valueChanged)
        
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(switcher)
        NSLayoutConstraint.activate([
            switcher.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switcher.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])

    }


    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc private func switherSegmentChanged() {
        switch switcher.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: 0.5) {
                self.preferredContentSize = CGSize(width: 300, height: 280)
            }
        case 1:
            UIView.animate(withDuration: 0.5) {
                self.preferredContentSize = CGSize(width: 300, height: 150)
            }
        default: break
        }
    }
}

