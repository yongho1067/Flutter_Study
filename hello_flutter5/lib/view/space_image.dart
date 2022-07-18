import 'package:flutter/material.dart';

// stateless, stateful 일경우 이므로

class SpaceImage extends StatelessWidget{
  const SpaceImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GridView.count(
      // GridView = column 개념
      //row에는 2개 그림
      crossAxisCount: 2,
      padding: EdgeInsets.all(25.0),
      mainAxisSpacing: 35.0,
      crossAxisSpacing: 35.0,
      children: [
        Image.asset('images/space.jpg', fit:BoxFit.none), // 원본그대로나오게
        Image.asset('images/space.jpg',
            fit:BoxFit.fill), // area fill, 그림그대로출력
        Image.asset('images/space.jpg', fit:BoxFit.cover),
        // area fill, 비율이 그대로라서 지금 그림의 상하가 짤림
        Image.asset('images/space.jpg', fit:BoxFit.fitWidth),
        // 가로 폭에 맞추므로 상하가 짤릴 수 있음.
        Image.asset('images/space.jpg',fit:BoxFit.fitHeight),
        // 세로 높이에 맞추므로 세로는 다나오게 되는데 가로는 모름
        
        Image.network("https://cdn.pixabay.com/photo/2017/09/12/11/56/universe-2742113_960_720.jpg"
        , width: 400, height: 400,),
        Image.network("https://www.nasa.gov/sites/default/files/thumbnails/image/main_image_star-forming_region_carina_nircam_final-5mb.jpg"
          , width: 400, height: 400,)

      ],
    );
  }
}


