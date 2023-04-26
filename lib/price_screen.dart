import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'currency_bar.dart';
class PriceScreen extends StatefulWidget {
  @override

  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  initState() {
    super.initState();
    First();
  }

  void First() async {
    var decodeData = await coinModel.getCurrentPrice("USD");
    print("$decodeData");
    return updateUI(decodeData);
  }

  CoinModel coinModel = CoinModel();

  String priceCurrency = "?";
  String selectedCurrency = "USD";


  void updateUI(dynamic decodeData) {
    setState(() {
      try {
        priceCurrency = decodeData.toStringAsFixed(0);
      } catch (e) {
        print(e);
      }
      // print("YES");
      // if (decodeData == null) {
      //   priceCurrency = "Error";
      //   return;
      // }
      // print("DECODE $decodeData");
      // double selCur = decodeData["rate"];
      // priceCurrency = selCur.toStringAsFixed(0);
      // print("AAAAAAAAAAAAAAAAAAAAA $priceCurrency");
    });
  }

  DropdownButton<String> andoidDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      // for (var curren in currenciesList)
      // DropdownMenuItem(
      //   child: Text(curren),
      //   value: curren,
      // ),

      onChanged: (value) async {
        selectedCurrency = value!;
        var decodeData = await coinModel.getCurrentPrice(value);
        updateUI(decodeData);
      },
    );
  }

  CupertinoPicker IOSPickker() {
    List<Text> dropDownItems2 = [];
    for (var i in currenciesList) {
      var newItem = Text(i);
      dropDownItems2.add(newItem);
    }
    return CupertinoPicker(
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) async {
          var decodeData = await coinModel
              .getCurrentPrice(dropDownItems2[selectedIndex].data);
          updateUI(decodeData);
        },
        children: dropDownItems2);
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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: CurrencyBar(priceCurrency: priceCurrency, selectedCurrency: selectedCurrency,firstCurrency: "1 BTC", secondtCurrency: "$priceCurrency $selectedCurrency",),
              
            ),
          ),

          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child:
              Platform.isIOS ? IOSPickker() : andoidDropDown(),
              ), //[for (var curren in currenciesList) Text(curren)]
        ],
      ),
    );
  }
}

