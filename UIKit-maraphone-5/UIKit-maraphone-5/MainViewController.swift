import UIKit

class MainViewController: UIViewController {
    private let presentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.blue, for: .normal)
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(presentButton)
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])

    }

    @objc func presentButtonTapped() {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .popover
        secondVC.preferredContentSize = CGSize(width: 300, height: 280)
        
        guard let presentationVC = secondVC.popoverPresentationController else { return }
        presentationVC.delegate = self
        presentationVC.sourceView = presentButton
        presentationVC.permittedArrowDirections = .up
        presentationVC.sourceRect = CGRect(x: presentButton.bounds.midX, y: presentButton.bounds.maxY, width: 0, height: 0)
        present(secondVC, animated: true)
    }
    
}

extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}
