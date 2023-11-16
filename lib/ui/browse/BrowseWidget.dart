import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/model/category/Genres.dart';

class BrowseWidget extends StatelessWidget {
  List<Genres>? genList;
  int index;
  List<String> imageList=[
    'https://fandomwire.com/wp-content/uploads/2022/07/Avengers-5-official-title-leaked-by-Disney-1.jpg',
    'https://unitingartists.org/wp-content/uploads/2020/06/Adventure-Genre-800x445.jpg',
    'https://www.hollywoodreporter.com/wp-content/uploads/2018/12/spider-man-_into_the_spiderverse-toy_story_4-lego_movie_2-split-publicity_stills-h_2018.jpg?w=1296',
    'https://hips.hearstapps.com/hmg-prod/images/home-alone-1585876454.jpg',
    'https://www.huskerlaw.com/wp-content/uploads/2023/03/Close-up.-Arrested-man-handcuf-1024x682.jpg',
    'https://documentary.org/sites/default/files/images/articles/spring2015_wildlife_2.jpg',
    'https://wwd.com/wp-content/uploads/2023/03/MSDTITA_FE057.jpg?w=1024',
    'https://hips.hearstapps.com/hmg-prod/images/christmas-movies-1-1638382439.jpg?crop=1.00xw:1.00xh;0,0&resize=1200:*',
    'https://www.reelviews.net/resources/img/posters/thumbs/aladdin_poster.jpg',
    'https://www.boredpanda.com/blog/wp-content/uploads/2022/04/historical-movies-1-625ff6a57458a__700.jpg',
    'https://media.gq.com/photos/59efa5f866e2d56abcd7a055/16:9/w_2560%2Cc_limit/state-of-horror-gq.jpg',
    'https://nofilmschool.com/media-library/seb-played-by-ryan-gosling-and-mia-played-by-emma-stone-dancing-above-the-la-skyline-in-la-la-land.jpg?id=34079625&width=1245&height=700&quality=90&coordinates=0%2C78%2C0%2C79',
    'https://hips.hearstapps.com/hmg-prod/images/best-murder-mystery-movies-1659380419.jpg?crop=0.471xw:1.00xh;0.323xw,0&resize=1200:*',
    'https://media1.popsugar-assets.com/files/thumbor/vgqiXGG5okiKJ9cNFPh7LjC_oDE=/fit-in/792x528/top/filters:format_auto():upscale()/2023/01/04/894/n/1922283/0d000089ea50ce70_HG_14_0364_R_f.jpg',
    'https://d3.harvard.edu/platform-rctom/wp-content/uploads/sites/4/2016/11/Avatar.jpg',
    'https://variety.com/wp-content/uploads/2017/02/motd-e1487033122618.png',
    'https://3.bp.blogspot.com/-HRZoc9RTEbE/ULDDx2WYa9I/AAAAAAAAAMQ/1UPvrh2ekDg/s1600/imagery+1.png',
    'https://cloudfront-eu-central-1.images.arcpublishing.com/thenational/HHYC4TEYQM5W7YPOQOASNNXLCE.jpg',
    'https://pbblogassets.s3.amazonaws.com/uploads/2022/06/08050851/Western-Genre-Guide.jpg',
  ];
  BrowseWidget(this.genList,this.index);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(imageUrl: imageList[index]
        ,height: double.infinity,
          width: 200,
          fit: BoxFit.cover,
        ),
        Container(color:Color(0x54000000) ,height:double.infinity,width: 200,),

        Center(child: Text('${genList?[index].name}',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
      ],
    );
  }
}
