class AppApis {
  // ==================== Server Configuration ====================
  static const String baseurl = 'https://trent2.catalystegy.com/trent/';
  static const String notificationUrl = 'https://fcm.googleapis.com/fcm/send';
  static String? firebaseKey;
  static String? projectID = "trent-9d06e";
  static const String path = '${baseurl}user_api/';
  static const googleKey = "AIzaSyDbeg4RQW5M5LL7P-2LKaVjOnsMghPDR9o";
  static const String imageUrl = baseurl; // Base URL for images
  static const paymentBaseUrl = baseurl; // Base URL for payments

  // ==================== Core Functionality ====================
  static const String calendar = 'calendar.php'; // Calendar operations
  static const String reviewlist = 'review_list.php'; // List reviews
  static const String registerUser = 'u_verify_signup.php'; // User registration
  static const String mobileChack = 'mobile_check.php'; // Mobile number verification (Note: Original spelling preserved)
  static const String loginApi = 'u_login_user.php'; // User login
  static const String pageListApi = 'u_pagelist.php'; // Get page listings
  static const String couponlist = 'u_couponlist.php'; // List coupons
  static const String couponCheck = 'u_check_coupon.php'; // Validate coupons
  static const String forgetPassword = 'u_forget_password.php'; // Password recovery
  static const String faqApi = 'u_faq.php'; // Frequently asked questions
  static const String walletReportApi = 'u_wallet_report.php'; // Wallet reports
  static const String walletUpdateApi = 'u_wallet_up.php'; // Update wallet
  static const String userDataApi = 'u_get_data.php'; // Get user data

  // ==================== Chat System ====================
  static const String getChatListApi = 'u_chat_list.php'; // List chats
  static const String getChatMessagesApi = 'u_chat_messages.php'; // Get chat messages
  static const String sendChatMessagesApi = 'u_add_chat.php'; // Send chat message

  // ==================== User Profile ====================
  static const String editUserDataApi = 'u_profile_edit.php'; // Edit user profile
  static const String homeDataApi = 'u_home_data.php'; // Homepage data
  static const String addAndRemoveFavourite = 'u_property_toggle_favorite.php'; // Manage favorites
  static const String propertyDetails = 'u_property_details.php'; // Property details
  static const String searchApi = 'u_search_property.php'; // Property search
  static const String sliderApi = 'u_slider_list.php'; // Slider content
  static const String checDateApi = 'u_check.php'; // Date validation (Note: Original spelling preserved)
  static const String updateMobileNumber = 'u-change-mobile.php'; // Update mobile number
  static const String verifyOtp = 'verify_otp.php'; // verify otp
  static const String resetPassword = 'u_forget_password.php'; // verify otp
  
  // ==================== Booking System ====================
  static const String bookApi = 'u_book.php'; // Create booking
  static const String statusWiseBook = 'u_book_status_wise.php'; // Status-based bookings
  static const String bookingCancle = 'u_book_cancle.php'; // Cancel booking (Note: Original spelling preserved)
  static const String bookingDetails = 'u_book_details.php'; // Booking details
  static const String reviewApi = 'u_rate_update.php'; // Submit review
  static const String catWiseData = 'u_cat_wise_property.php'; // Category-based properties

  // ==================== Notifications & Enquiries ====================
  static const String notification = 'notification.php'; // Notifications
  static const String enquiry = 'u_enquiry.php'; // Create enquiry
  static const String seeAllGalery = 'view_gallery.php'; // View gallery (Note: Original spelling preserved)
  static const String allCountry = 'u_country.php'; // Country list
  static const String deletAccount = 'acc_delete.php'; // Delete account (Note: Original spelling preserved)

  // ==================== Subscription System ====================
  static const String subScribeList = 'u_package.php'; // Subscription packages
  static const String packagePurchase = 'u_package_purchase.php'; // Purchase package
  static const String dashboardApi = 'u_dashboard.php'; // User dashboard

  // ==================== Property Management ====================
  static const String propertyList = 'u_property_list.php'; // List properties
  static const String addPropertyApi = 'u_property_add.php'; // Add property
  static const String editPropertyApi = 'u_property_edit.php'; // Edit property
  static const String deletePropertyApi = 'u_property_delete.php'; // Delete property

  // ==================== Media Management ====================
  static const String extraImageList = 'u_extra_list.php'; // Additional images
  static const String addExtraImage = 'u_add_exra.php'; // Add extra image (Note: Original spelling preserved)
  static const String editExtraImage = 'u_extra_edit.php'; // Edit extra image
  static const String categoryList = 'u_category_list.php'; // List categories
  static const String governmenList = 'u_government_list.php'; // Government list (Note: Original spelling preserved)
  static const String facilityList = 'u_facility_list.php'; // Facility list

  // ==================== Gallery System ====================
  static const String galleryCatList = 'u_gallery_cat_list.php'; // Gallery categories
  static const String addGalleryCat = 'u_gal_cat_add.php'; // Add gallery category
  static const String upDateGalleryCat = 'u_gal_cat_edit.php'; // Update gallery category
  static const String galleryList = 'gallery_list.php'; // List gallery items
  static const String addGallery = 'add_gallery.php'; // Add gallery item
  static const String editGallery = 'update_gallery.php'; // Edit gallery item
  static const String proWiseGalleryCat = 'property_wise_galcat.php'; // Property-wise gallery categories

  // ==================== Subscription Details ====================
  static const String subScribeDetails = 'u_sub_details.php'; // Subscription details
  static const String minMaxPriceApi = 'u_min_max_price.php'; // Price range data

  // ==================== Professional Bookings ====================
  static const String proBookStatusWise = 'u_my_book.php'; // Professional bookings
  static const String proBookingDetails = 'my_book_details.php'; // Professional booking details
  static const String proBookingCancle = 'u_my_book_cancle.php'; // Professional booking cancellation

  // ==================== Check-in/Check-out ====================
  static const String confirmedBooking = 'u_confim.php'; // Confirm booking (Note: Original spelling preserved)
  static const String proCheckIN = 'u_check_in.php'; // Professional check-in
  static const String proCheckOutConfirmed = 'u_check_out.php'; // Professional check-out

  // ==================== Sales & Marketing ====================
  static const String makeSellProperty = 'u_sale_prop.php'; // Sell property
  static const String enquiryListApi = 'u_my_enquiry.php'; // Enquiry list

  // ==================== Financial System ====================
  static const String requestWithdraw = 'request_withdraw.php'; // Withdrawal requests
  static const String payOutList = 'payout_list.php'; // Payout list

  // ==================== Filters & Search ====================
  static const String filtersData = 'u_get_filters_api.php'; // Filter data
}