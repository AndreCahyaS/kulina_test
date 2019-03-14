import 'package:flutter/material.dart';
import '../utils/cards.dart';
import '../utils/container_generator.dart';
import '../data/offline_data.dart';

class KulinaHome extends StatefulWidget {
  KulinaHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<KulinaHome> {  

  int _selectedIndex = 0;
  void onBottomDrawerTapped(int index){
    setState(() 
    {
            _selectedIndex = index;
    });
  }   
  //TextStyling =========================
  
  TextStyle _title2 = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  TextStyle _title3 = TextStyle(fontSize: 24, color: Colors.black);
  TextStyle _subtitle1 = TextStyle(color: Colors.grey, fontSize: 14);

  //Starting the UI ===============================================

  @override
  Widget build(BuildContext context) {            
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,   
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,            
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,      
                  children: <Widget>[
                    Text('Hi ' + user['user_name'],
                          style: _title3,
                    ),
                    Text('Saldo Rp. ' + user['saldo'].toString(), 
                          style: _subtitle1,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/user_pic.jpg') //Should've been filled with user img url.
                  ),                    
                ),                
              ),
            ],
          ),
        ),
      ),
      body: Center(  
        child: 
          ListView(
            children:<Widget>[                      
              Container( //Time Category
                margin: EdgeInsets.fromLTRB(6, 24, 6, 4),
                padding: EdgeInsets.only(left: 5, right: 5),                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    createSmallCardImg('images/sun.png','Lunch',true),
                    createSmallCardImg('images/crescent_moon.png','Diner',true),
                    createSmallCardImg('images/confetti.png','Event',true),                  
                  ],
                )              
              ),
              Container( //FeaturedProduct              
                margin: EdgeInsets.fromLTRB(6, 24, 6, 4),
                padding: EdgeInsets.only(left: 5, right: 5),                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Featured Product',style: _title2),
                    Container(
                      height: 200,
                      child: populateImgListView("FeaturedProduct"),                        
                    )                    
                  ],
                )                                
              ),
              Container( //Ads 
                margin: EdgeInsets.fromLTRB(6, 24, 6, 4), 
                child: Image.network('https://lelogama.go-jek.com/post_featured_image/promo_payday_.jpg'),
              ),
              Container( //JenisMasakan
                margin: EdgeInsets.fromLTRB(6, 24, 6, 4),
                alignment: Alignment.centerLeft,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,                 
                  children: <Widget>[
                    Text('Jenis Masakan', style: _title2),
                    generateGridJenisMakanan(),
                  ],                  
                )                
              ),
              Container( //NewProduct
                margin: EdgeInsets.fromLTRB(6, 24, 6, 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('New Product', style: _title2),
                    populateImgListView('NewProduct'),
                  ],                  
                ),               
              ),
              Container( //Harga
                margin: EdgeInsets.fromLTRB(6, 24, 6, 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Harga',style: _title2),
                    generateGridKategoriHarga(),
                  ],
                ),
              ),
          ],
        ) 
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap:onBottomDrawerTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            title: Text('Home',style: TextStyle(color: Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket, color: Colors.grey),
            title: Text('Pesanan',style: TextStyle(color: Colors.grey)),            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, size:20, color: Colors.grey),
            title: Text('Dompet',style: TextStyle(color: Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard, color: Colors.grey),
            title: Text('Referral',style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),    
    );       
  }
}
