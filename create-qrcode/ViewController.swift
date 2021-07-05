//
//  ViewController.swift
//  create-qrcode
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var qrCodeImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        qrCodeImg.layer.borderWidth = 1
        qrCodeImg.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        generateQRCode(url: "https://www.naver.com")
    }

    func generateQRCode(url:String)  {
        let data = url.data(using: String.Encoding.ascii)
        let filterName = "CIQRCodeGenerator" //QRCode를 생성 할 것이기 때문에 CIQRCodeGenerator Filter 사용
        /*
         //CIFilter 모음
         - CIFilter : 이미지 효과
         https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/uid/TP40004346
         */
        if let filter = CIFilter(name: filterName) {
            filter.setValue(data, forKey: "inputMessage") //QR생성시 이부분에 inputMessage라는 키를 넣는지는 아직 모르겠다. - 다른 키로 변경하면 크래쉬 발생
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            if let output = filter.outputImage?.transformed(by: transform) {
                qrCodeImg.image = UIImage(ciImage: output)
                
            }
        }
        
    }
}

