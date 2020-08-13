import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/providers/coffee_provider.dart';
import 'package:flutter/material.dart';


class GetDrinksImage extends StatelessWidget{
  int imageNO;
  GetDrinksImage({this.imageNO});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: 70,
                height: 70,
                child: Image(image: imageNO==0?CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CoffeeImages%2FEspresso.png?alt=media&token=b030f983-51b7-4c80-a57b-a6cdaa812ac3'):
                imageNO==1?CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CoffeeImages%2FMocha.png?alt=media&token=d99e7070-6be1-49f1-8665-5adcd4e3d336'):
                imageNO==2?CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CoffeeImages%2Fmacciato.png?alt=media&token=7643b3d4-7a1c-435d-a583-a0cc576cf41b'):
                imageNO==3?CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CoffeeImages%2Flatte.png?alt=media&token=a6c99f3f-1032-43e2-96a7-beb9e3d80e74'):
                CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CoffeeImages%2FCappuccino.png?alt=media&token=3ecb9b1d-4b01-459d-803f-2f691365ced9')
                ),
              );
  }
}

class GetCartImages extends StatelessWidget{
  int imageNO;
  GetCartImages({this.imageNO});
  @override
  Widget build(BuildContext context) {
    return Image(image: imageNO==0?CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CartImages%2FcartEspresso.png?alt=media&token=091efddf-24df-42e7-9017-17436200840c'):
    imageNO==1?CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CartImages%2FcartMocha.png?alt=media&token=5889f722-ba77-4012-a489-47c3349c61e6'):
    imageNO==2?CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CartImages%2Fcartmacciato.png?alt=media&token=f4f88af1-a3ae-4c55-b921-f3a136e247ae'):
    imageNO==3?CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CartImages%2Fcartlatte.png?alt=media&token=68312e5d-e53e-4f9e-a69a-52649361d3b4'):
    CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/coffeehubapp-48994.appspot.com/o/CartImages%2FcartCappuccino.png?alt=media&token=121b82ca-0a58-4fee-8417-73c4d9c31fb5')
    );
  }
}