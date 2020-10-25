//
//  ViewController.swift
//  FtcMobileAdsExample
//
//  Created by KYPoseidonL on 2020/10/16.
//

import UIKit


class ViewController: UIViewController , UITextFieldDelegate, FtcInterstitialDelegate {
    
    @IBOutlet weak var btnGetBanner: UIButton!
    @IBOutlet weak var btnGetInterstitial: UIButton!
    
    @IBOutlet weak var txtAccountID: UITextField!
    @IBOutlet weak var txtZoneID: UITextField!
    
    @IBOutlet weak var txtLog: UITextView!

    @IBOutlet weak var btnDisplayInterstitial: UIButton!
    @IBOutlet weak var btnDismiss: UIButton!
    
    @IBOutlet weak var bannerContainer: UIView!
    
    var accountID:Int!
    var zoneID:Int!

    var interstitialReady:Bool = false
    
    var interstitial :FtcInterstitial!
    var ftcBanner :FtcBanner!

    override func viewDidLoad() {
        super.viewDidLoad()
        txtAccountID.delegate = self
        txtZoneID.delegate = self
    }

    @IBAction func onGetBannerClick(_ sender: Any) {
        txtAccountID.text = "180130"
        txtZoneID.text = "457319"
        if(!validateInputs(includePublisher:false)){
            return
        }
        btnDismiss.isHidden = false
        let config: PlacementRequestConfig = PlacementRequestConfig.init(accountId: self.accountID, zoneId: self.zoneID, width: 0, height: 0, keywords: [], click: "")
         FtcMobileAds.requestPlacement(with: config, success: { (status, placements) in
             print(placements!)
             if (status == FtcResponseStatus.success) {
                self.ftcBanner = FtcBanner.init(placement: placements?[0] as! Placement, container: self.bannerContainer, placementRequestConfig: config)
             }
         }) { (error) in
             print(error!)
         }
    }
    
    @IBAction func onGetInterstitialClick(_ sender: Any) {
        txtAccountID.text = "180130"
//        txtZoneID.text = "457480"
//        txtZoneID.text = "457320"
        txtZoneID.text = "457543"
        if(!validateInputs(includePublisher:false)){
            return
        }
        
        let config: PlacementRequestConfig = PlacementRequestConfig.init(accountId: self.accountID, zoneId: self.zoneID, width: 0, height: 0, keywords: [], click: "")
        FtcMobileAds.requestPlacement(with: config, success: { (status, placements) in
            print(placements!)
            if (status == FtcResponseStatus.success) {
                self.interstitial = FtcInterstitial.init(placement: placements?[0] as! Placement, delegate: self)
            }
        }) { (error) in
            print(error!)
        }
    }
    
    @IBAction func onDisplayInterstitialClick(_ sender: Any) {
        btnDisplayInterstitial.isHidden = true
        self.interstitial.present(fromRootViewController: self)
    }
    @IBAction func onDismissClick(_ sender: Any) {
        self.ftcBanner.destroy()
        btnDismiss.isHidden = true
    }
    
    func validateInputs(includePublisher:Bool) -> Bool{
         let accountText = txtAccountID.text
         if(accountText == nil || accountText!.isEmpty){
             log("Invalid account ID")
             return false
         }else{
             let accountID = Int(accountText!) ?? 0
             if(accountID == 0){
                 log("Invalid account ID")
                 return false
             }else{
                 self.accountID = accountID
             }
         }
         
         let zoneText = txtZoneID.text
         if(zoneText == nil || zoneText!.isEmpty){
             log("Invalid zone ID")
             return false
         }else{
             let zoneID = Int(zoneText!) ?? 0
             if(zoneID == 0){
                 log("Invalid zone ID")
                 return false
             }else{
                 self.zoneID = zoneID
             }
         }
     
         return true
     }
    
    // DELEGATE FUNCTIONS
    func log(_ str:String){
        txtLog.text = "> " + str + "\n" + txtLog.text
        NSLog(str) // also log to xcode
    }
    
    func interstitialReady(_ interstitial: FtcInterstitial) {
        log("Interstitial :: ready")
        btnDisplayInterstitial.isHidden = false
    }
    
    func interstitialFailed(toLoad interstitial: FtcInterstitial) {
        log("Interstitial :: failed")
    }
   
    func interstitialClosed(_ interstitial: FtcInterstitial) {
        log("Interstitial :: close")
    }
    func interstitialStartLoad(_ interstitial: FtcInterstitial) {
        log("Interstitial :: start load")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}



