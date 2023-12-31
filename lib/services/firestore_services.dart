import 'package:Indi_shark/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//users data
class FirestoreServices{
  static Future<DocumentSnapshot<Map<String, dynamic>>> getUser(uid) async {
    final data = await firestore.collection(userCollection).doc(uid).get();
    return data;
    // return firestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
  }
  //   get products according to category
  static getProducts(category){
    return firestore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();
  }

  static getSubCategoryProducts(title){
    return firestore.collection(productsCollection).where('p_subcategory', isEqualTo: title).snapshots();

  }

  //get cart

  static getCart(uid){
    // print(uid);
    return firestore.collection(cartCollection).where('added_by', isEqualTo: uid).snapshots();

  }
  //delete document

  static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }

//  get all chat messages

  static getChatMessages(docId, from){
    return firestore.collection(chatsCollection)
        .where("fromId", isEqualTo: from)
        .where("toId", isEqualTo: docId)
        .orderBy('created_on', descending:false)
        .snapshots();

  }
  
  static getAllOrders(){
    return firestore.collection(ordersCollection).where('order_by', isEqualTo: currentUser!.uid).snapshots();
  }
  static getWishlists(){
    return firestore.collection(productsCollection).where('p_wishlist', arrayContains: currentUser!.uid).snapshots();

  }
  static getAllMessages(){
    return firestore
        .collection(chatsCollection)
        .where('fromId', isEqualTo: currentUser!.uid).snapshots();

  }
  static getCounts() async{
    var res = await Future.wait([
      firestore.collection(cartCollection).where('added_by',isEqualTo: currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
      firestore.collection(productsCollection).where('p_wishlist', arrayContains: currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
      firestore.collection(ordersCollection).where('order_by', isEqualTo: currentUser!.uid).get().then((value){
        return value.docs.length;
      })
    ]);
    return res;
  }
  static allproducts(){
    return firestore.collection(productsCollection).snapshots();

  }
//  get featured products method
  static getFeaturedProducts(){
    return firestore.collection(productsCollection).where('is_featured', isEqualTo: true).get();

  }
  
  static searchProducts(title){
    return firestore.collection(productsCollection).get();
  }





}



