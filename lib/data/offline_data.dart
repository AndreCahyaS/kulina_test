
import 'package:flutter/material.dart';  

var user = {
  'user_name':'Andre Susanto',
  'saldo':72000,
};

List<String> jnsMasakan = ['Nusantara','Western','Japanese','Chinese','Healthy','Oriental'];
List<MaterialColor> colorCodeJnsMasakan = [Colors.brown,Colors.blue,Colors.red,Colors.yellow,Colors.green,Colors.orange]; 

var masakan = {
  'D\'Cost Lunch':{
    'gambar':'images/rendang.jpg',
    'logo':'images/farmToMarket_catering.png',
    'harga':40000,
    'New':true,
    'Featured':false
  },
  'Healthy Lunch': {
    'gambar':'images/gado_gado.jpg',
    'logo':'images/farmToMarket_catering.png',
    'harga':35000,
    'New':false,
    'Featured':true
  },
  'Betawi Corner Lunch':{
    'gambar':'images/sate_kambing.jpg',
    'logo':'images/farmToMarket_catering.png',
    'harga':35000,
    'New':true,
    'Featured':true
  },
  'Pak Ben (Paket Bento)':{
    'gambar':'images/bento_box.jpg',
    'logo':'images/farmToMarket_catering.png',
    'harga':40000,
    'New':true,
    'Featured':true
  }
};

List<String> kategoriHargaTitle = ['Budget', 'Value', 'Casual', 'Premium'];
List<String> kategoriHargaSubTitle = ['Kurang dari 25rb', 'Dari 25rb - 34rb', 
                                      'Dari 35rb - 49rb', 'Lebih dari 50rb',];