import UIKit
import EPSignature
import SignaturePad
import fluid_slider
import StepSlider

class myCustomVC: UIViewController, EPSignatureDelegate
{
    @IBOutlet var rootView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    
    @IBOutlet weak var lbl: UILabel!
    
    var lastadded : UILabel!
    var valChange : (() -> Void)?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let min : Double = -40
        let max : Double = 120
        let step : Double = 4
        
        let difference = abs(min - max)
        let ticknum = difference/step + 1
        
        
        
        let slid = StepSlider()
        slid.translatesAutoresizingMaskIntoConstraints = false
        slid.maxCount = UInt(ticknum)
        slid.trackHeight = 4
        slid.trackCircleRadius = 0
        slid.trackColor = UIColor.purple
        slid.sliderCircleColor = UIColor.black
        slid.backgroundColor = UIColor.cyan
        slid.tintColor = UIColor.red
        view.addSubview(slid)
        
        slid.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        
        slid.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.70).isActive = true
        slid.heightAnchor.constraint(equalToConstant: 36).isActive = true
        slid.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slid.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        slid.layoutIfNeeded()
        
        let lblMin = UILabel()
        lblMin.translatesAutoresizingMaskIntoConstraints = false
        lblMin.text = String(min)
        lblMin.textAlignment = .center
        lblMin.backgroundColor = UIColor.red
        view.addSubview(lblMin)
        
        lblMin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        lblMin.heightAnchor.constraint(equalTo: slid.heightAnchor, multiplier: 1).isActive = true
        lblMin.rightAnchor.constraint(equalTo: slid.leftAnchor).isActive = true
        lblMin.centerYAnchor.constraint(equalTo: slid.centerYAnchor, constant: -12).isActive = true
        lblMin.layoutIfNeeded()
        
        let lblMax = UILabel()
        lblMax.translatesAutoresizingMaskIntoConstraints = false
        lblMax.text = String(max)
        lblMax.textAlignment = .center
        view.addSubview(lblMax)
        
        lblMax.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        lblMax.heightAnchor.constraint(equalTo: slid.heightAnchor, multiplier: 1).isActive = true
        lblMax.leftAnchor.constraint(equalTo: slid.rightAnchor).isActive = true
        lblMax.centerYAnchor.constraint(equalTo: slid.centerYAnchor).isActive = true
        lblMax.layoutIfNeeded()
        
    
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = UIColor.cyan
        lbl.textColor = UIColor.orange
        lbl.textAlignment = .center
        lbl.font = lbl.font.withSize(48)
        view.addSubview(lbl)
        
        lbl.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lbl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.86, constant: 0).isActive = true
        lbl.heightAnchor.constraint(equalToConstant: 260).isActive = true
        lbl.layoutIfNeeded()
        
        valChange =
            {
                let val = slid.index
                let valueToShow = min + (step*Double(val))
                lbl.text = String(valueToShow)
                print(valueToShow)
            }
//        let slider = Slider()
//        slider.translatesAutoresizingMaskIntoConstraints = false
//
//        slider.setMinimumLabelAttributedText(NSAttributedString(string: "-40"))
//        slider.setMaximumLabelAttributedText(NSAttributedString(string: "120"))
//        slider.fraction = 20
//        slider.shadowOffset = CGSize(width: 0, height: 10)
//        slider.shadowBlur = 5
//        slider.shadowColor = UIColor(white: 0, alpha: 0.1)
//        slider.contentViewColor = UIColor(red: 78/255.0, green: 77/255.0, blue: 224/255.0, alpha: 1)
//        slider.valueViewColor = .white
//
//        slider.attributedTextForFraction = { fraction in
//            let formatter = NumberFormatter()
//            formatter.maximumIntegerDigits = 4
//            formatter.maximumFractionDigits = 2
//            let string = formatter.string(from: ((fraction * (120 + 40)) - 40 ) as NSNumber) ?? ""
//            return NSAttributedString(string: string)
//        }
//        view.addSubview(slider)
//
//        slider.widthAnchor.constraint(equalToConstant: 260).isActive = true
//        slider.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        slider.layoutIfNeeded()
        
//        let testButton = myCameraButton()
//        view.addSubview(testButton)
//
//        testButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        testButton.heightAnchor.constraint(equalToConstant: 57).isActive = true
//        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:80).isActive = true
//        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        testButton.layoutIfNeeded()
//
//        view.bringSubview(toFront: testButton)
//
//        let imgView = UIImageView()
//        imgView.tag = 9000
//        imgView.translatesAutoresizingMaskIntoConstraints = false
//        imgView.backgroundColor = UIColor.yellow
//        imgView.contentMode = .scaleAspectFit
//
//        view.addSubview(imgView)
//        imgView.topAnchor.constraintEqualToSystemSpacingBelow(view.topAnchor, multiplier: 1).isActive = true
//        imgView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
//        imgView.centerXAnchor.constraintEqualToSystemSpacingAfter(view.centerXAnchor, multiplier: 1).isActive = true
//        imgView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.36).isActive = true
//
//
//
//
//        let signPad = SignaturePad()
//        signPad.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(signPad)
//        signPad.bottomAnchor.constraintEqualToSystemSpacingBelow(view.bottomAnchor, multiplier: 1).isActive = true
//        signPad.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
//        signPad.centerXAnchor.constraintEqualToSystemSpacingAfter(view.centerXAnchor, multiplier: 1).isActive = true
//        signPad.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.36).isActive = true
//
//
//        testButton.click =
//            {
//                //                let signatureVC = EPSignatureViewController(signatureDelegate: self, showsDate: true, showsSaveSignatureOption: true)
//                //                signatureVC.subtitleText = "I agree to the terms and conditions"
//                //                signatureVC.title = "John Doe"
//                //                let nav = UINavigationController(rootViewController: signatureVC)
//                //                self.present(nav, animated: true, completion: nil)
//
//                let sigh = signPad.getSignature()!
//                imgView.image = sigh
//                signPad.clear()
        //}
        
        var hasChild : Bool = false
        for v in view.subviews
        {
            if v.tag == 123456
            {
                hasChild = true
                break
            }
        }
        
        print(hasChild)
    }
    
    @objc func valueChanged()
    {
        valChange?()
    }
    
    func epSignature(_: EPSignatureViewController, didSign signatureImage: UIImage, boundingRect: CGRect)
    {
        let imgView = view.viewWithTag(9000) as! UIImageView
        imgView.image = signatureImage
    }
    
    @objc func test()
    {
        print(self.lastadded.frame.size.height)
    }
    
    
    func instanceFromNib() -> myCustomVC
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"vc1") as! myCustomVC
        return viewController
    }
}


class myCameraButton : UIButton
{

    var click : (() -> Void)?
    
    func customInit()
    {
        layer.cornerRadius = 6
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor.red
        setTitleColor(UIColor.cyan, for: .normal)
        setTitle("Камера", for: .normal)
        self.addTarget(self, action:#selector(myCameraButton.btnPressed), for: .touchUpInside)
        tag = 12345
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        customInit()
    }
    
    @objc func btnPressed()
    {
        print("sdfasdf")
        click?()
    }
}

