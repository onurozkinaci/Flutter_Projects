import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'EUR';
  List<DropdownMenuItem<String>> _dropDownItems;

  CoinData coinData = CoinData();
  Map<String, double> _coinPrices = {};

  //String bitcoinValue = '?';
  //TODO 7: Figure out a way of displaying a '?' on screen while we're waiting for the price data to come back. Hint: You'll need a ternary operator.
  bool isWaiting = false;

  /*Uygulama ilk acildiginda default deger olan 'EUR' icin de API ile veri cekilmesi icin (initState ile yalnizca bir kez
  en basta veri cekilir). getData()'yi cagirip isWaiting=true olarak guncellenince ve _coinPrices'a deger ataninca CryptoCardlar
  olusturulabildiginden (generateCryptoCards() icerisinde) bu saglanir;
  */
  @override
  void initState() {
    super.initState();
    getData(); //to fetch data at the initialization for default dropdown selection too.
  }

  //TODO 6: Update this method to receive a Map containing the crypto:price key value pairs. Then use that map to update the CryptoCards.
  void getData() async {
    isWaiting = true;
    try {
      Map<String, double> prices =
          await CoinData().getCoinData(selectedCurrency);
      isWaiting = false; //data is fetched.
      setState(() {
        //bitcoinValue = prices[cryptoType].toStringAsFixed(0);
        _coinPrices = prices;
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androidDropdown() {
    _dropDownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      _dropDownItems.add(DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: _dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  /*List<DropdownMenuItem> getDropdownItems() {
    _dropDownItems = []; //**Being initialized each time it is called since it
    // should be reset and created again in case of build() method called again and again
    //for example after applying the setState() method. Otherwise, same items will be added
    //on top of the previous list which is printed as dropdownlist items and it will cause an error.

    for (int i = 0; i < currenciesList.length; i++) {
      _dropDownItems.add(DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      ));
    }
    //print(counter);
    return _dropDownItems;
  }
   */
   */

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
          setState(() {
            selectedCurrency = currenciesList[selectedIndex];
            getData();
          });
        },
        children: pickerItems);
  }

  Widget getPicker() {
    if (Platform.isIOS)
      return iOSPicker();
    else if (Platform.isAndroid) return androidDropdown();
  }

  //TODO: For bonus points, create a method that loops through the cryptoList and generates a CryptoCard for each.
  List<CryptoCard> generateCryptoCards() {
    List<CryptoCard> cards = [];
    for (String crypto in cryptoList) {
      cards.add(
        CryptoCard(
          currencyType: crypto,
          bitcoinValue:
              isWaiting ? '?' : _coinPrices[crypto].toStringAsFixed(0),
          selectedCurrency: selectedCurrency,
        ),
      );
    }
    return cards;
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
            children: generateCryptoCards(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  final String bitcoinValue;
  final String selectedCurrency;
  final String currencyType;

  CryptoCard({this.currencyType, this.bitcoinValue, this.selectedCurrency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 $currencyType = $bitcoinValue $selectedCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
