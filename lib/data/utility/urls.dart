class Urls {
  static const _baseUrl = 'http://ecom-api.teamrabbil.com/api';
  static String sendEmailOtp(email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(email, otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static const readProfile = '$_baseUrl/ReadProfile';
  static const completeProfile = '$_baseUrl/CreateProfile';
  static const homeBannerList = '$_baseUrl/ListProductSlider';
  static const categoryList = '$_baseUrl/CategoryList';
  static productsByCategory(int categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';
  static const popularProductList = '$_baseUrl/ListProductByRemark/popular';
  static const specialProductList = '$_baseUrl/ListProductByRemark/special';
  static const newProductList = '$_baseUrl/ListProductByRemark/new';
  static productDetailsById(int productId) => '$_baseUrl/ProductDetailsById/$productId';
  static const cartList = '$_baseUrl/CartList';
  static const addToCart = '$_baseUrl/CreateCartList';
  static const wishlist = '$_baseUrl/ProductWishList';
  static deleteCartItem(productId) => '$_baseUrl/DeleteCartList/$productId';
  static addToWishlist(productId) => '$_baseUrl/CreateWishList/$productId';
  static removeWishlist(productId) => '$_baseUrl/RemoveWishList/$productId';
  static reviewList(int productId) => '$_baseUrl/ListReviewByProduct/$productId';
  static const addNewReview = '$_baseUrl/CreateProductReview';
  static const createInvoice = '$_baseUrl/InvoiceCreate';
}
