import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_item.dart';
import 'package:flutter_burclar/data/strings.dart';

import 'model/burc.dart';

class burcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;

   burcListesi() {
     tumBurclar=veriKaynaginiHazirla();

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burç Listesi'),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return BurcItem(listelenenBurc: tumBurclar[index]);
      },
      itemCount: tumBurclar.length,
      )
      );

  }
//Burçları Stringden çekip geçicide döndürüp verikaynağını hazırlaya attık onuda tumBurclar listesine yolladık
  List<Burc> veriKaynaginiHazirla() {
     List<Burc> gecici=[];
     for(int i=0;i<12;i++){
       var burcAdi=Strings.BURC_ADLARI[i];
       var burcTarihi=Strings.BURC_TARIHLERI[i];
       var burcDetayi=Strings.BURC_GENEL_OZELLIKLERI[i];
       //koc1.png değerini oluşturmak için Kocu çekip küçültüp ekleme yapıcaz
       var burcKucukResim=Strings.BURC_ADLARI[i].toLowerCase()+ '${i+1}.png';
       //koc_buyuk1.png elde edicez koc+_buyuk+index+1.png
       var burcBuyukResim=Strings.BURC_ADLARI[i].toLowerCase()+ '_buyuk' + '${i+1}.png';
       Burc eklenecekBurc=Burc(burcAdi,burcTarihi,burcDetayi,burcKucukResim,burcBuyukResim);
       gecici.add(eklenecekBurc);
     }
     return gecici;
  }
}
