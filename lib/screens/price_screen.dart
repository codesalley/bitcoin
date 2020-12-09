import 'dart:ffi';

import 'package:bitcoin_ticker/utilities/networkData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../coin_data.dart';
import '../coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String price = '?';
  String crypto;
  String btcRate = '?';
  String ltcRate = '?';
  String ethRate = '?';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getPrice(String secound) async {
    var btcData =
        await NetworkData(crypto: 'BTC', currency: '$secound').getData();
    var ethData =
        await NetworkData(crypto: 'ETH', currency: '$secound').getData();
    var ltcData =
        await NetworkData(crypto: 'LTC', currency: '$secound').getData();
    double btctmp = btcData['rate'];
    double ltctmp = ltcData['rate'];
    double ethtmp = ethData['rate'];
    setState(() {
      btcRate = btctmp.toInt().toString();
      ltcRate = ltctmp.toInt().toString();
      ethRate = ethtmp.toInt().toString();
    });

    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () {},
                  child: Text('try')),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[0]} = $btcRate ${price} ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[1]} =  $ethRate ${price} ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[2]} =  $ltcRate ${price}  ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 30,

              //magnification: 0.9,
              //diameterRatio: 0.6,
              onSelectedItemChanged: (value) {
                setState(() {
                  price = currenciesList[value];
                  getPrice(price);
                });

                print(currenciesList[value]);
              },
              children: currenciesList
                  .map((e) => Text(
                        '$e',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Padding(
// padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
// child: Card(
// color: Colors.lightBlueAccent,
// elevation: 5.0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0),
// ),
// child: Padding(
// padding:
// EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
// child: Text(
// '1 BTC = ? USD',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20.0,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
