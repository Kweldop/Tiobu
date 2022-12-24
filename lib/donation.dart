import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class Donation extends StatefulWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {

  final _formKey=GlobalKey<FormState>();
  Map data={};
  String donatedMoney='0';
  String donorName='';
  String message='';

  @override
  Widget build(BuildContext context) {
    data =ModalRoute.of(context)!.settings.arguments as Map;
    final creatorName=data['name'];
    final image= data['image'];
    final id=data['id'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          iconSize: 30,
        ),
        title: Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(image),),
              const SizedBox(width: 10,),
              Text('$creatorName',style: const TextStyle(color: Colors.black,fontSize: 25),),
              const SizedBox(width: 10,),
              const Icon(CommunityMaterialIcons.check_decagram,color: Colors.blue,),
            ]
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const Border(bottom: BorderSide(color: Colors.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Send your love to $creatorName to become a real fan',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.center),
            const SizedBox(height: 40,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38,width: 2)
                    ),
                    child: TextFormField(
                      validator: (value) => (value!.isEmpty || value=='0')?'Enter a valid amount':null,
                      onChanged: (val){
                        setState((){
                          if(val==''){
                            donatedMoney='0';
                          }else{
                            donatedMoney=val;
                          }
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.attach_money,color: Colors.black,),
                        hintText: 'Enter amount *',
                        border:InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38,width: 2)
                    ),
                    child: TextField(
                      onChanged: (val){
                        setState(() {
                          donorName=val;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Your name (optional)',
                        border:InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38,width: 2)
                    ),
                    child: TextField(
                      onChanged: (val){
                        setState(() {
                          message=val;
                        });
                      },
                      maxLines: null,
                      minLines: null,
                      expands: true,
                      decoration: const InputDecoration(
                        hintText: 'Say something nice. (optional)',
                        border:InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: ()async{
          if(_formKey.currentState!.validate()){
            print('CreatorId= $id\nDonor name= $donorName\nMoney donated= $donatedMoney\nMessage= $message');
            await FirebaseFirestore.instance.collection(id).doc().set({
              'name': donorName,
              'Amount': donatedMoney,
              'message': message,
            });
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 40),
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.purple[400],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text('Support \$ $donatedMoney',style: const TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
    );
  }
}
