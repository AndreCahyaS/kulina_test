import 'package:flutter/material.dart';
import '../data/offline_data.dart';
import 'cards.dart';

Container generateGridJenisMakanan(){
    List<Widget> _topCategory = new List<Widget>();
    List<Widget> _botCategory = new List<Widget>();
    for (var i = 0; i < jnsMasakan.length/2; i++) {
      _topCategory.add(createSmallCardIcon(colorCodeJnsMasakan[i], jnsMasakan[i], false));
    }
    for (var i = _topCategory.length; i < jnsMasakan.length; i++) {
      _botCategory.add(createSmallCardIcon(colorCodeJnsMasakan[i], jnsMasakan[i], false));
    }

    Container contain = 
      Container(      
        alignment: Alignment.center,
        child:Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _topCategory,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _botCategory,
            ),
          ],
        )
      );

    return contain;
  }

  Container generateGridKategoriHarga(){
    List<Widget> _topCategory = new List<Widget>();
    List<Widget> _botCategory = new List<Widget>();
    for (var i = 0; i < kategoriHargaTitle.length/2; i++) {
      _topCategory.add(createMediumCardStack(kategoriHargaTitle[i] , kategoriHargaSubTitle[i], Icons.monetization_on, i));
    }
    for (var i = _topCategory.length; i < kategoriHargaTitle.length; i++) {
      _botCategory.add(createMediumCardStack(kategoriHargaTitle[i], kategoriHargaSubTitle[i], Icons.monetization_on, i));
    }

    Container _contain = 
      Container(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: _topCategory,
            ),
            Row(
              children: _botCategory,
            ),
          ],
        )
      );

    return _contain;
  }

  Container populateImgListView(String _productCategory){        
    int _itemCount = 0;
    List<String> _gambarMakanan = new List();
    List<String> _logoComp = new List();
    List<String> _nmMakanan = new List();
    List<String> _harga = new List();

    void iterasi(key, value){
      //debugPrint("masakan : " + key.toString());
      String _tempMakanan = key.toString();
      void extractValue(key, value){
        if (_productCategory == 'FeaturedProduct')
        {
          //print("keydalem : " + key);
          //print("valueDalem : " + value.toString());
          if (key == 'Featured')
          {
            if(value == true)
            {
              _itemCount++;
              _gambarMakanan.add(masakan[_tempMakanan]['gambar'].toString());
              _logoComp.add(masakan[_tempMakanan]['logo'].toString());
              _nmMakanan.add(_tempMakanan.toString());
              _harga.add(masakan[_tempMakanan]['harga'].toString());
            }
          }
        }
        else if(_productCategory == 'NewProduct')
        {
          if (key == 'New')
          {
            if(value == true)
            {
              _itemCount++;
              _gambarMakanan.add(masakan[_tempMakanan]['gambar'].toString());
              _logoComp.add(masakan[_tempMakanan]['logo'].toString());
              _nmMakanan.add(_tempMakanan.toString());
              _harga.add(masakan[_tempMakanan]['harga'].toString());
            }
          }
        }
      }

      value.forEach(extractValue);
    }

    masakan.forEach(iterasi);

    Container contain = Container(
      height: 200,             
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _itemCount,
        itemBuilder: (context, index){
          return createBigCard(_gambarMakanan[index], _logoComp[index], _nmMakanan[index], _harga[index]);          
        }
      )
    );

    return contain;
  }