//
//  PageController.swift
//  PageController
//
//  Created by xxxxx on 2020/02/10.
//

import Cocoa

let array = ["page 1", "page 2", "page 3", "page 4", "page 5", "page 6"]

class PageController: NSPageController, NSPageControllerDelegate {
    
    @IBAction func moveThreePage(_ sender: Any) {
        //アニメーションしない場合
        //self.selectedIndex = 2
        
        // グループ化しないとレイアウトが崩れる。
        // https://stackoverflow.com/questions/60144454/nspagecontroller-if-selectedindex-is-used-at-animator-autoresizingmask-has-n
        //self.animator().selectedIndex = 2
        
        // 参考資料
        // https://developer.apple.com/documentation/appkit/nspagecontroller
        // Completing the Page Controller Transition
        /*
         An NSPageController instance uses a private view hierarchy during swiping. To create a seamless transition to the new content, it is your responsibility to inform the page controller when you are ready to draw the new content. Ideally, the new content should match the snapshot so the user is none the wiser. You inform the page controller to complete the transition by calling completeTransition(). If needed, a view controller is prepared and then the content view is shown (or added) to the view hierarchy and the private transition view is hidden.

         During page controller initiated animations, pageControllerWillStartLiveTransition(_:) and pageControllerDidEndLiveTransition(_:) are invoked on the delegate. Generally during pageControllerDidEndLiveTransition(_:) you will call completeTransition(). Programatic animations via the animator proxy do not call the delegate methods and you are responsible for calling completeTransition() when the animation completes.This is easily done via a completion handler on an NSAnimationContext grouping. For example:
         
         //To instantly change the selectedIndex:
          pageController.selectedIndex = newIndex;
         
          //To animate a selectedIndex change:
          [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
            [[pageController animator] setSelectedIndex:newIndex];
          } completionHandler:^{
            [pageController completeTransition];
          }];
         */
        NSAnimationContext.runAnimationGroup({ context in
            self.animator().selectedIndex = 2
        }, completionHandler: {
            self.completeTransition()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.arrangedObjects = array
    }
    
    func pageController(_ pageController: NSPageController, viewControllerForIdentifier identifier: String) -> NSViewController {
        let vc = self.storyboard!.instantiateController(withIdentifier: "ViewController") as! ViewController
        vc.view.autoresizingMask = [.height, .width]
        return vc
    }
    
    func pageController(_ pageController: NSPageController, identifierFor object: Any) -> String {
        return "ViewController"
    }
    
    func pageController(_ pageController: NSPageController, prepare viewController: NSViewController, with object: Any?) {
        guard let item = object as? String,
              let itemVC = viewController as? ViewController else {
            return
        }
        
        itemVC.item = item
    }
    
    func pageControllerDidEndLiveTransition(_ pageController: NSPageController) {
        self.completeTransition()
    }
}
