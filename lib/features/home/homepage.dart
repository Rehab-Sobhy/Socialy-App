import 'package:flutter/material.dart';

class HomepView extends StatefulWidget {
  const HomepView({super.key});

  @override
  State<HomepView> createState() => _HomepViewState();
}

class _HomepViewState extends State<HomepView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Image.asset(
          "assets/images/Instagram_logo_wordmark_logotype-800x450.png",
          width: MediaQuery.of(context).size.width * .21,
          color: Colors.white,
        ),
        actions: [ IconButton(onPressed: () {}, icon: Icon(Icons.comment_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.login_outlined)),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [SizedBox(height: 30,),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration:BoxDecoration(shape: BoxShape.circle,color: Colors.grey,) ,
                child: CircleAvatar(radius: 30,
                  backgroundImage: NetworkImage(
                "https://th.bing.com/th/id/OIP.NZP1SdhK25I1riexGNH2xAAAAA?w=434&h=650&rs=1&pid=ImgDetMain"
                   ),

                ),


              ),
              SizedBox(width: 10,),
              Text("user Name",style: TextStyle(fontSize: 20,color: Colors.white),),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
            ],
          ),
              SizedBox(height: 15,),
          Container(
            height: 200,
              width: double.infinity,
              child: Image.network("https://th.bing.com/th/id/OIP.NZP1SdhK25I1riexGNH2xAAAAA?w=434&h=650&rs=1&pid=ImgDetMain",
                fit:BoxFit.fill ,)),
              SizedBox(height: 15,),
              Row(children: [IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),

                IconButton(onPressed: (){}, icon: Icon(Icons.comment)),
                IconButton(onPressed: (){}, icon: Icon(Icons.send)),
              Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined)),



              ],
              ),
              Row(
                children: [
                  Text("10 Likes",style:TextStyle(fontSize: 16,color: Colors.grey) ,),
                ],
              ),
              Row(
                children: [
                  Text("Rehab said Nice ",style:TextStyle(fontSize: 20,color: Colors.white) ,),
                ],
              ),
              Row(
                children: [
                  Text("View all 100 comments",style:TextStyle(fontSize: 16,color: Colors.grey) ,),
                ],
              ),
              Row(
                children: [
                  Text("19 April 2004",style:TextStyle(fontSize: 16,color: Colors.grey) ,),
                ],
              ),
        ]),
      ),

    );
  }
}
