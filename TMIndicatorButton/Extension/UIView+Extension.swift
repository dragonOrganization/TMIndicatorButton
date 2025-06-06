import UIKit

public extension UIView {
    /**
     Set the corner radius of the view.
     
     - Parameter color:        The color of the border.
     - Parameter cornerRadius: The radius of the rounded corner.
     - Parameter borderWidth:  The width of the border.
     */
    func setCornerBorder(color: UIColor? = nil, cornerRadius: CGFloat = 15.0, borderWidth: CGFloat = 1.5) {
        self.layer.borderColor = color != nil ? color!.cgColor : UIColor.clear.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    /**
     Set the shadow layer of the view.
     
     - Parameter bounds:       The bounds in CGRect of the shadow.
     - Parameter cornerRadius: The radius of the shadow path.
     - Parameter shadowRadius: The radius of the shadow.
     */
    func setAsShadow(bounds: CGRect, cornerRadius: CGFloat = 0.0, shadowRadius: CGFloat = 1) {
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = true
        self.clipsToBounds = false
    }
    
    /**
     Add subviews and make it prepared for AutoLayout.
     
     - Parameter views: The views to be added as subviews of current view.
     */
    func addSubViews(_ views: [UIView]) {
        views.forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
    }
    
    /**
     Make the specified view (in parameter) to be centered of current view.
     
     - Parameter view: The view to be positioned to the center of current view.
     */
    func centerSubView(_ view: UIView) {
        self.addConstraints(
            [
                NSLayoutConstraint(item: view, attribute: .centerX,
                                   relatedBy: .equal,
                                   toItem: self, attribute: .centerX,
                                   multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: view, attribute: .centerY,
                                   relatedBy: .equal,
                                   toItem: self, attribute: .centerY,
                                   multiplier: 1.0, constant: 0.0)
            ]
        )
    }
} 