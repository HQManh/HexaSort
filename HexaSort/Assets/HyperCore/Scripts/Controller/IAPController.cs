//using System;
//using System.Collections;
//using System.Collections.Generic;

//using UnityEngine;
//using UnityEngine.Events;
//using UnityEngine.Purchasing;
//using UnityEngine.UI;
//#if RECEIPT_VALIDATION
//using UnityEngine.Purchasing.Security;
//#endif

//public enum PurchaseID
//{
//    NO_ADS,
//    PACK_1,
//    PACK_2,
//}

//public class IAPController : MonoBehaviour, IStoreListener
//{

//    // Use this for initialization
//    public static IAPController Instance { get; set; }
//    private static IStoreController m_StoreController;          // The Unity Purchasing system.
//    private static IExtensionProvider m_StoreExtensionProvider; // The store-specific Purchasing subsystems.

//    public static string kProductIDSubscription = "subscription";

//    // ID Item Google play
//    public static string[] ItemIDs = new string[] {
//#if UNITY_ANDROID
//        Constants.PackageName+".noads",
//#else
//        Constants.PackageName+".adsremoval",
//#endif
//        Constants.PackageName+".pack1",
//        Constants.PackageName+".pack2",
//    };
//    //ID Item Apple Store
//    //To Do
//    public Dictionary<string, Product> ProductInfo { get; set; }

//    // Apple App Store-specific product identifier for the subscription product.
//    private static string kProductNameAppleSubscription = "";

//    // Google Play Store-specific product identifier subscription product.
//    private static string kProductNameGooglePlaySubscription = "";

//    private UnityEvent purchaseSuccessNoAds;
//    private IAPEvent purchaseSuccessPackage1;
//    private IAPEvent purchaseSuccessPackage2;

//    private void Awake()
//    {
//        Instance = this;
//    }

//    private void Start()
//    {
//        ProductInfo = new Dictionary<string, Product>();
//        // If we haven't set up the Unity Purchasing reference
//        if (m_StoreController == null)
//        {
//            // Begin to configure our connection to Purchasing
//            InitializePurchasing();
//        }
//    }

//    public void InitializePurchasing()
//    {
//        // If we have already connected to Purchasing ...
//        if (IsInitialized())
//        {
//            // ... we are done here.
//            return;
//        }

//        var builder = ConfigurationBuilder.Instance(StandardPurchasingModule.Instance());
//        // Continue adding the non-consumable product.
//#if UNITY_ANDROID
//        builder.AddProduct(ItemIDs[(int)PurchaseID.NO_ADS], ProductType.Consumable);
//#elif UNITY_IOS
//        builder.AddProduct(ItemIDs[(int)PurchaseID.NO_ADS], ProductType.NonConsumable);
//#endif
//        builder.AddProduct(ItemIDs[(int)PurchaseID.PACK_1], ProductType.Consumable);
//        builder.AddProduct(ItemIDs[(int)PurchaseID.PACK_2], ProductType.Consumable);
//        // TODO change product type for character from Consumable to NonConsumable
//        // And finish adding the subscription product. Notice this uses store-specific IDs, illustrating
//        // if the Product ID was configured differently between Apple and Google stores. Also note that
//        // one uses the general kProductIDSubscription handle inside the game - the store-specific IDs 
//        // must only be referenced here. 
//        //builder.AddProduct(kProductIDSubscription, ProductType.Subscription, new IDs(){
//        //    { kProductNameAppleSubscription, AppleAppStore.Name },
//        //    { kProductNameGooglePlaySubscription, GooglePlay.Name },
//        //});

//        // Kick off the remainder of the set-up with an asynchrounous call, passing the configuration 
//        // and this class' instance. Expect a response either in OnInitialized or OnInitializeFailed.
//        UnityPurchasing.Initialize(this, builder);
//    }


//    private bool IsInitialized()
//    {
//        // Only say we are initialized if both the Purchasing references are set.
//        return m_StoreController != null && m_StoreExtensionProvider != null;
//    }


//    public void BuyNoAds(UnityEvent onSuccess)
//    {
//        // Buy the consumable product using its general identifier. Expect a response either 
//        // through ProcessPurchase or OnPurchaseFailed asynchronously.
//        purchaseSuccessNoAds = onSuccess;
//        BuyProductID(ItemIDs[(int)PurchaseID.NO_ADS]);
//#if UNITY_ANDROID
//        // These followings are for testing only
//#endif
//#if UNITY_IOS
//        //TO DO
//#endif
//    }

//    public void BuyStarPack(IAPEvent onSuccess,int id)
//    {
//        switch (id)
//        {
//            case 1:
//                purchaseSuccessPackage1 = onSuccess;
//                BuyProductID(ItemIDs[(int)PurchaseID.PACK_1]);
//                break;
//            case 2:
//                purchaseSuccessPackage2 = onSuccess;
//                BuyProductID(ItemIDs[(int)PurchaseID.PACK_2]);
//                break;
//            default:
//                break;
//        }
//    }

//    private void BuyProductID(string productId)
//    {
//        // If Purchasing has been initialized ...
//        if (IsInitialized())
//        {
//            // ... look up the Product reference with the general product identifier and the Purchasing 
//            // system's products collection.
//            Product product = m_StoreController.products.WithID(productId);

//            // If the look up found a product for this device's store and that product is ready to be sold ... 
//            if (product != null && product.availableToPurchase)
//            {
//                Debug.Log(string.Format("Purchasing product asychronously: '{0}'", product.definition.id));
//                // ... buy the product. Expect a response either through ProcessPurchase or OnPurchaseFailed 
//                // asynchronously.
//                m_StoreController.InitiatePurchase(product);
//            }
//            // Otherwise ...
//            else
//            {
//                // ... report the product look-up failure situation  
//                Debug.Log("BuyProductID: FAIL. Not purchasing product, either is not found or is not available for purchase");
//            }
//        }
//        // Otherwise ...
//        else
//        {
//            // ... report the fact Purchasing has not succeeded initializing yet. Consider waiting longer or 
//            // retrying initiailization.
//            Debug.Log("BuyProductID FAIL. Not initialized.");
//        }
//    }

//    // Restore purchases previously made by this customer. Some platforms automatically restore purchases, like Google. 
//    // Apple currently requires explicit purchase restoration for IAP, conditionally displaying a password prompt.
//    public void RestorePurchases()
//    {
//        // If Purchasing has not yet been set up ...
//        if (!IsInitialized())
//        {
//            // ... report the situation and stop restoring. Consider either waiting longer, or retrying initialization.
//            Debug.Log("RestorePurchases FAIL. Not initialized.");
//            return;
//        }

//        // If we are running on an Apple device ... 
//        if (Application.platform == RuntimePlatform.IPhonePlayer ||
//            Application.platform == RuntimePlatform.OSXPlayer)
//        {
//            // ... begin restoring purchases
//            Debug.Log("RestorePurchases started ...");

//            // Fetch the Apple store-specific subsystem.
//            var apple = m_StoreExtensionProvider.GetExtension<IAppleExtensions>();
//            // Begin the asynchronous process of restoring purchases. Expect a confirmation response in 
//            // the Action<bool> below, and ProcessPurchase if there are previously purchased products to restore.
//            apple.RestoreTransactions((result) =>
//            {
//                // The first phase of restoration. If no more responses are received on ProcessPurchase then 
//                // no purchases are available to be restored.
//                Debug.Log("RestorePurchases continuing: " + result + ". If no further messages, no purchases available to restore.");
//            });
//        }
//        // Otherwise ...
//        else
//        {
//            // We are not running on an Apple device. No work is necessary to restore purchases.
//            Debug.Log("RestorePurchases FAIL. Not supported on this platform. Current = " + Application.platform);
//        }
//    }


//    //  
//    // --- IStoreListener
//    //

//    public void OnInitialized(IStoreController controller, IExtensionProvider extensions)
//    {
//        // Purchasing has succeeded initializing. Collect our Purchasing references.
//        Debug.Log("OnInitialized: PASS");

//        // Overall Purchasing system, configured with products for this application.
//        m_StoreController = controller;
//        // Store specific subsystem, for accessing device-specific store features.
//        m_StoreExtensionProvider = extensions;
//        for (int i = 0; i < ItemIDs.Length; i++)
//        {
//            ProductInfo.Add(ItemIDs[i], m_StoreController.products.WithID(ItemIDs[i]));
//        }
//    }


//    public void OnInitializeFailed(InitializationFailureReason error)
//    {
//        // Purchasing set-up has not succeeded. Check error for reason. Consider sharing this reason with the user.
//        Debug.Log("OnInitializeFailed InitializationFailureReason:" + error);
//    }


//    public PurchaseProcessingResult ProcessPurchase(PurchaseEventArgs args)
//    {
//        // A consumable product has been purchased by this user.
//        if (String.Equals(args.purchasedProduct.definition.id, ItemIDs[(int)PurchaseID.NO_ADS], StringComparison.Ordinal))
//        {
//            purchaseSuccessNoAds.Invoke();
//        }
//        else if (String.Equals(args.purchasedProduct.definition.id, ItemIDs[(int)PurchaseID.PACK_1], StringComparison.Ordinal))
//        {
//            purchaseSuccessPackage1.Invoke(1);
//        }
//        else if (String.Equals(args.purchasedProduct.definition.id, ItemIDs[(int)PurchaseID.PACK_2], StringComparison.Ordinal))
//        {
//            purchaseSuccessPackage2.Invoke(2);
//        }
//        // Or ... an unknown product has been purchased by this user. Fill in additional products here....
//        else
//        {
//            Debug.Log(string.Format("ProcessPurchase: FAIL. Unrecognized product: '{0}'", args.purchasedProduct.definition.id));
//        }

//        // Return a flag indicating whether this product has completely been received, or if the application needs 
//        // to be reminded of this purchase at next app launch. Use PurchaseProcessingResult.Pending when still 
//        // saving purchased products to the cloud, and when that save is delayed. 
//        return PurchaseProcessingResult.Complete;
//    }

//    public void OnPurchaseFailed(Product product, PurchaseFailureReason failureReason)
//    {
//        // A product purchase attempt did not succeed. Check failureReason for more detail. Consider sharing 
//        // this reason with the user to guide their troubleshooting actions.
//        Debug.Log(string.Format("OnPurchaseFailed: FAIL. Product: '{0}', PurchaseFailureReason: {1}", product.definition.storeSpecificId, failureReason));
//    }
//}
