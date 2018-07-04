import UIKit
import Pageboy
import Tabman

class PageBoyVCClass:  TabmanViewController, PageboyViewControllerDataSource
{
    var listOfMyVC : [UIViewController] = []
    let listOfColors : [UIColor] = [UIColor.cyan,
                                     UIColor.green,
                                     UIColor.purple,
                                     UIColor.black,
                                     UIColor.red]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
//        for i in 0...4
//        {
//            let newVC = myCustomVC().instanceFromNib()
//            newVC.view.backgroundColor = listOfColors[i]
//            newVC.lbl.text = "fdsafsdf"
//            newVC.lbl.backgroundColor = UIColor.orange
//            newVC.myScrollView.backgroundColor = UIColor.black
//            
//            listOfMyVC.append(newVC)
//        }
//        
        self.view.clipsToBounds = true
        self.dataSource = self
        self.bar.appearance = TabmanBar.Appearance({ (appearance) in
            appearance.layout.minimumItemWidth = self.view.bounds.size.width / CGFloat(listOfMyVC.count)
            appearance.layout.interItemSpacing = 0
            appearance.layout.edgeInset = 0
            //appearance.layout.itemVerticalPadding = 0
            appearance.state.color = UIColor.gray
            appearance.state.selectedColor = UIColor.black
            appearance.style.background = TabmanBar.BackgroundView.Style.solid(color: UIColor.blue)
        })
        self.bar.style = .scrollingButtonBar
        self.bar.items = [Item(title: "Page 1"),
                          Item(title: "Page 2"),
                          Item(title: "Page 3"),
                          Item(title: "Page 4"),
                          Item(title: "Page 5")]
    }
    
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int
    {
        return listOfMyVC.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController?
    {
        return listOfMyVC[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page?
    {
       return nil
    }
    
   
    
}
