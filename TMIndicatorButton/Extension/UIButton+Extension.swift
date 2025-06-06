import UIKit

public typealias TMCallback = (() -> Void)?

// MARK: - Global functions
func delay(_ delay: Double, block: @escaping () -> (Void)) {
    DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + delay), execute: block)
}

public extension UIButton {
    /**
     Set button image for all button states
     
     - Parameter image: The image to be set to the button.
     */
    func setImage(_ image: UIImage?) {
        for state : UIControl.State in [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved] {
            self.setImage(image, for: state)
        }
    }
    
    /**
     Set button title for all button states
     
     - Parameter text: The text to be set to the button title.
     */
    func setTitle(_ text: String?) {
        for state : UIControl.State in [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved] {
            self.setTitle(text, for: state)
        }
    }
} 