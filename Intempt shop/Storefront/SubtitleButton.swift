

import UIKit

class SubtitleButton: RoundedButton {
    
    @IBInspectable var subtitle: String = ""
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        
        guard let title = title else {
            super.setTitle(nil, for: state)
            return
        }
        
        let currentFont  = self.titleLabel!.font!
        let currentColor = self.titleColor(for: state) ?? .white
        
        let style           = NSMutableParagraphStyle()
        style.alignment     = .center
        style.lineBreakMode = .byClipping
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: [
            .font           : currentFont,
            .paragraphStyle : style,
            .foregroundColor: currentColor
        ])
        
        let attributedSubtitle = NSAttributedString(string: "\n\(self.subtitle)", attributes: [
            .font           : UIFont(descriptor: currentFont.fontDescriptor, size: currentFont.pointSize * 0.6),
            .paragraphStyle : style,
            .foregroundColor: currentColor.withAlphaComponent(0.6)
        ])
        
        attributedTitle.append(attributedSubtitle)
        
        self.titleLabel?.numberOfLines = 0
        
        super.setAttributedTitle(attributedTitle, for: state)
    }
}
