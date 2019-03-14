import 'package:flutter/material.dart';

  Container createSmallCardImg(String _imageUrl, String _botText, bool _useShadow){
    Container _smallCardContainer;
    if(_useShadow)
    {
      _smallCardContainer = Container(        
        child:Card(          
          child: Container(            
            padding: EdgeInsets.all(3),
            child:Column(                                           
              children: <Widget>[                            
                Image(image: AssetImage(_imageUrl), 
                      width: 90,
                      ),
                Text(_botText, style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),                
          )          
        ),      
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10.0, spreadRadius: 0.001)],
        ),
      );
    }
    else  
    {
      _smallCardContainer = Container(
        child:Card(                                                   
          child: Column(
            children: <Widget>[
              Image(image: AssetImage(_imageUrl), 
                    width: 100,
                    height: 100,
                    ),
              Text(_botText),
            ],
          ),
        ), 
      );
    }

    return _smallCardContainer;
  }

  Container createSmallCardIcon(MaterialColor _iconColor, String _botText, bool _useShadow){
    Container _smallCardContainer;
    if(_useShadow)
    {
      _smallCardContainer = Container(
        width: 110,
        height: 110,
        child:Card(                                                
          child: Column(            
            children: <Widget>[
              Icon(Icons.favorite,
                  size: 20,
                  color: _iconColor,
              ),
              Text(_botText),
            ],
          ),
        ),      
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10.0, spreadRadius: 0.001)],
        ),
      );
    }
    else  
    {
      _smallCardContainer = Container(
        width: 115,
        height: 115,
        child:Card(                                                   
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.favorite,
                  size: 20,
                  color: _iconColor,
              ),
              Text(_botText,style: TextStyle(color: _iconColor)),
            ],
          ),
        ), 
      );
    }

    return _smallCardContainer;
  }

  Container createBigCard(String _foodImageUrl, String _companyImgUrl, String _foodName, String _pricing){
    Container _bigCardContainer = 
    Container(
      child:Card(                                                   
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,          
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(
                height: 150,
                width: 170
              ),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(                
                image: DecorationImage(                  
                  image: AssetImage(_foodImageUrl),
                  fit: BoxFit.fill
                )
              ),
              child: Container(                
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin:  const FractionalOffset(0.0, 0),
                    end:  const FractionalOffset(0, 0.5),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Column(       
                  crossAxisAlignment: CrossAxisAlignment.stretch,                  
                  children: <Widget>[
                    Text(_foodName,style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('Rp '+_pricing+' /hari',style: TextStyle(color: Colors.white, fontSize: 12,)),
                  ],
                ),
              )                
            ),
            Container(
              margin: EdgeInsets.all(8),
              child:Image(image: AssetImage(_companyImgUrl),
                          height: 25,            
              ),
            )
          ],
        )        
      ),
    );
    return _bigCardContainer;
  }

  Container createMediumCardStack(String _title, String _subTitle, IconData _icon, int _numOfStack){
        
    List<Widget> forCoins = new List();
    for (var i = 0; i < _numOfStack+1; i++) {
      forCoins.add(
        Container(
          margin: EdgeInsets.only(left: (i * 9.0)),
          child: Icon(_icon, size:20, color: Color.fromRGBO(80, 255, 80, 1.0 - i*0.2),)
        ),
      );
    }    

    Container contain = 
      Container(        
        width: 170,
        height: 100,
        child: Card(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,            
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(_title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(_subTitle),
                Stack(
                  textDirection: TextDirection.ltr,
                  overflow: Overflow.clip,
                  children: forCoins,
                )
              ],
            ),
          )          
        )

        
      );
    return contain;
  }