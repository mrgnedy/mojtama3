import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/localizations.dart';


class IDSitem extends StatelessWidget {
  final String price;
  final String id;

  IDSitem(this.price, this.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 7, left: 7),
        child: ClipRRect(

          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.grey[400],
            child: GridTile(

              child:Align(
                  alignment: Alignment.center,
                  child: Text(id)),
              footer: Container(
                padding: EdgeInsets.all(5),
                color: Colors.black54,
                child: Text(
                  price+"   "+ AppLocalizations.of(context).lblCoins ,style: TextStyle(
                    height: 1.2,
                    color: Colors.white,
                    fontFamily: "thin"
                ),
                  textAlign: TextAlign.center,
                ),

              ),
            ),
          ),
        )
    );
  }
}
