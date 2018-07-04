import UIKit

class pageVCViewController: UIPageViewController , UIPageViewControllerDelegate, UIPageViewControllerDataSource
   //class pageVCViewController: TabmanViewController, PageboyViewControllerDataSource {
{
    lazy var sortedVC : [UIViewController] =
        {
            return [newVC(vcName: "vc1"),
                newVC(vcName: "vc2"),
                newVC(vcName: "vc3")]
        }()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstVC = sortedVC.first
        {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func newVC(vcName : String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vcName)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let currentIndex = sortedVC.index(of: viewController) else
        {
            return nil
        }
        
        let previousIndex = currentIndex - 1
        
        if previousIndex < 0
        {
            return nil
        }
        
        return sortedVC[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let currentIndex = sortedVC.index(of: viewController) else
        {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        
        if nextIndex >= sortedVC.count {
            return nil
        }
        
        return sortedVC[nextIndex]
    }
    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
//    {
//        guard let currentIndex = sortedVC.index(of: viewController)
//            else
//        {
//            return nil
//        }
//
//        let previousIndex = currentIndex - 1
//
//
//        guard previousIndex >= 0 else
//        {
//            return sortedVC.last
//        }
//
//        guard sortedVC.count > previousIndex else
//        {
//            return nil
//        }
//
//        return sortedVC[previousIndex]
//    }
    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
//    {
//        guard let currentIndex = sortedVC.index(of: viewController)
//            else
//        {
//            return nil
//        }
//
//        let nextIndex = currentIndex + 1
//
//        guard sortedVC.count !=  nextIndex else
//        {
//            return sortedVC.first
//        }
//
//        guard sortedVC.count > nextIndex else
//        {
//            return nil
//        }
//
//        return sortedVC[nextIndex]
//    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
