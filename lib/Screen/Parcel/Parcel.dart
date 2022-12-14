
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../EditField/Colors.dart';
import '../../Models/ParcelData.dart';
import '../../Provider/ParcelProvider.dart';
import '../../Widgets/DrawerSide.dart';
import '../../Widgets/SingleParcelItem.dart';
class Parcel extends StatefulWidget {

  @override
  State<Parcel> createState() => _ParcelState();
}

class _ParcelState extends State<Parcel> {
  @override
  Widget build(BuildContext context) {
    ParcelProvider parcelProvider = Provider.of(context);
    parcelProvider.getParcelData();
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        backgroundColor: scaffoldbackgroundColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text("Parcels", style: TextStyle(color: Colors.black),),
      ),
      body:   ListView.builder(
          itemCount: parcelProvider.getReviewCartData.length,
          itemBuilder: (context,index) {
            ParcelData parcelData = parcelProvider.getReviewCartData[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleParcelItem(
                parcelData.ParcelName,
                parcelData.PickUpAddress,
                parcelData.RecieverAddress,
                parcelData.orderid,
                parcelData.ParcelPrice,
                parcelData.time,
              ),
            );
          }
      ),
    );
  }
}
