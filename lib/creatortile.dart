import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class Creator extends StatefulWidget {
  final String name;
  final String profession;
  final String imageUrl;
  final String id;
  const Creator({super.key, required this.name,required this.profession,required this.imageUrl,required this.id});
  @override
  State<Creator> createState() => _CreatorState();
}

class _CreatorState extends State<Creator> {
  var icon=CommunityMaterialIcons.heart_outline;
  var iconColor=Colors.black;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/donation',arguments: {'name':widget.name,'image':widget.imageUrl,'id':widget.id});
                },
                child: Container(
                  height: 120,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text(widget.profession),
                  ],
                ),
                IconButton(onPressed: (){
                  setState(() {
                    icon=CommunityMaterialIcons.heart;
                    iconColor=Colors.pink;
                  });
                },
                  icon: Icon(icon),iconSize:25,color: iconColor,)
              ],
            )
          ],
        )
    );
  }
}