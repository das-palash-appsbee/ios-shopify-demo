
import UIKit
import WebKit

class WebViewController: UIViewController {
    
    let url: URL
    let accessToken: String?
    
    private let webView = WKWebView(frame: .zero)
    

    //  MARK: - Init -

    init(url: URL, accessToken: String?) {
        self.url         = url
        self.accessToken = accessToken
        
        super.init(nibName: nil, bundle: nil)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func initialize() {
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.webView)
        
        NSLayoutConstraint.activate([
            self.webView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.webView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.webView.topAnchor.constraint(equalTo: self.view.topAnchor),
        ])
        
        self.load(url: self.url)
    }
    

    //  MARK: - Request -

    private func load(url: URL) {
        var request = URLRequest(url: self.url)
        
        if let accessToken = self.accessToken {
            request.setValue(accessToken, forHTTPHeaderField: "X-Shopify-Customer-Access-Token")
        }
        self.webView.load(request)
    }
}
