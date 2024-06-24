
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/utils/styles.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:Colors.black12,
        title:const Text("Profile",style: Styles.TextStyle30) ,),

      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
              padding: const EdgeInsets.all(3),
              decoration:const BoxDecoration(shape: BoxShape.circle,color: Colors.grey,) ,
              child: const CircleAvatar(radius: 30,
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/OIP.NZP1SdhK25I1riexGNH2xAAAAA?w=434&h=650&rs=1&pid=ImgDetMain"
                ),

              ),
            ),
            SizedBox(width: 15,),
            Column(children:  [
              Text("Followers",style: Styles.TextStyle20.copyWith(color: Colors.white),),
                SizedBox(height: 10,),

              Text("50",style: Styles.TextStyle20.copyWith(color: Colors.white),),
    ]),

    SizedBox(width: 15,),

    Column(children:  [
    Text("Followers",style: Styles.TextStyle20.copyWith(color: Colors.white),),
    SizedBox(height: 10,),

    Text("100",style: Styles.TextStyle20.copyWith(color: Colors.white),),
]),

    SizedBox(width: 15,),
    Column(children:  [
    Text("Posts",style: Styles.TextStyle20.copyWith(color: Colors.white),),
    SizedBox(height: 10,),

    Text("10",style: Styles.TextStyle20.copyWith(color: Colors.white),),

    ],
    ),



            ],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.edit),label: Text("Edit"),
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey))
                ,),
                SizedBox(width: 15,),
                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.logout),label: Text("Log Out"),
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)))],



            ),
          ),
        ),
        SizedBox(height: 15,),
        Expanded(
          child: GridView(

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10
          ,
          mainAxisSpacing: 15,
          ),
          children:  [
           Container(
             height: 200,
             child: Image.network("https://th.bing.com/th/id/OIP.NZP1SdhK25I1riexGNH2xAAAAA?w=434&h=650&rs=1&pid=ImgDetMain"),),

            Container(
              height: 200,
              child: Image.network("https://th.bing.com/th/id/OIP.NZP1SdhK25I1riexGNH2xAAAAA?w=434&h=650&rs=1&pid=ImgDetMain"),),

            Container(
              height: 200,
              child: Image.network("https://th.bing.com/th/id/OIP.NZP1SdhK25I1riexGNH2xAAAAA?w=434&h=650&rs=1&pid=ImgDetMain"),),

          ],





          ),
        ),

          ]),
    );










  }
}


