import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../drawer.dart';
import 'Summry.dart';
import 'shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
   Login({ Key? key }) : super(key: key);
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String Username = 'Orange';
  String Password = 'SmartFarm@Orange2022';
  double? screenW, screenH;
  String?  Token;
  bool loading = true;
  Future<void> getToken(String Username,String Password) async{
  var url = Uri.https("smartfarmpro.com", "/v1/api/security/token");
  var res = await http.post(
    url,
    headers: <String,String>{
      "Content-Type" : "application/x-www-form-urlencoded"
    },
    body: {
      "Grant_Type": 'password', "Username": Username, "Password": Password
    }
  );
  if(res.statusCode == 200){
    print("token => ${res.body}");
    var token = jsonDecode(res.body);
    setState(() {
      Token = token['access_token'];
      loading = false;
    });

    if(loading == false){
      showDialog(
        barrierColor: Color.fromARGB(255, 148, 174, 149).withOpacity(0.3),
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                   height: screenH!  * 0.4,
                  width: screenW! * 0.5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15, left: 10),
                              height: screenH! * 0.06,
                              child: Text(
                                "??????????????????",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'THSarabun',
                                    color: Color(0xff44bca3)),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            //  color: Colors.white,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'X',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    Container(
                            margin: EdgeInsets.only(bottom: 5),
                 height: screenH!*0.2,
               decoration:  BoxDecoration(
                //  color: Colors.amberAccent
      image: DecorationImage(
          image: AssetImage("images/B1.jpg"), 
          fit: BoxFit.fill),
  ),),
                          Center(
                            child: 
           Text('???????????????????????????????????????',
        style: TextStyle(fontFamily: 'THSarabun',fontSize: 23)),
                            ),

                     Container(
                       child: TextButton(onPressed: () async{
                         Usersharedpreferences _p = Usersharedpreferences();
                          // await Usersharedpreferences.init();
                          await _p.setUserEmail(Username,Password);
 
               
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                         builder: (context)=> Drawer1(Token: Token,User: Username,Password:Password,),), (route) => false);
                              
                             setState(() {
                              
                             });
                             }, child:  Text('OK', style: TextStyle(fontFamily: 'Montserrat')),),
                     ),        
                                 
      //                     ListTile(
      //   title: Text('??????????????????',
      //   style: TextStyle(fontFamily: 'THSarabun',color: Colors.green,fontSize: 23)
      //     ),
      //   subtitle: Text('???????????????????????????????????????',
      //   style: TextStyle(fontFamily: 'THSarabun',fontSize: 23)),

      // ),
                      
                      
                    ],
                  ),
                ));
          });
        });
  //     showDialog(
  //    barrierDismissible: false,
  //   context: context,
  //   builder: (context) 
  //   => SimpleDialog(
  //     title: ListTile(
  //       title: Text('??????????????????',
  //       style: TextStyle(fontFamily: 'THSarabun',color: Colors.green,fontSize: 23)
  //         ),
  //       subtitle: Text('???????????????????????????????????????',
  //       style: TextStyle(fontFamily: 'THSarabun',fontSize: 23)),

  //     ),
  //     children: [
  //       TextButton(onPressed: () {
  //             Navigator.pushReplacement(context, MaterialPageRoute(
  //   builder: (context)=> Drawer1(Token: Token,User: Username,Password:Password,),));

  //       setState(() {
  //         // result = false;
  //         // email ='';
  //         // password1 =''; 
  //       });
  //       }  , child: Text('OK', style: TextStyle(fontFamily: 'Montserrat')),)
  //     ],
  //   ),
  // );
    }
    else{
      // normalDialog(context, '??????????????????','??????????????????????????????????????????????????????????????????????????????');
    }
  
    //  getjaon1(token['access_token']);
  }
  else{
    showDialog(
        barrierColor: Color.fromARGB(255, 148, 174, 149).withOpacity(0.3),
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: screenH!  * 0.4,
                  width: screenW! * 0.5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15, left: 10),
                              height: screenH! * 0.06,
                              child: Text(
                                "??????????????????",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'THSarabun',
                                    color: Color(0xff44bca3)),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            //  color: Colors.white,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'X',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                 height: screenH!*0.2,
               decoration:  BoxDecoration(
                //  color: Colors.amberAccent
      image: DecorationImage(
          image: AssetImage("images/B1.jpg"), 
          fit: BoxFit.fill),
  ),),
                          Center(
                            child: 
           Text('????????????????????????????????????????????????',
        style: TextStyle(fontFamily: 'THSarabun',fontSize: 23)),
                            ),
                 Container(
                       child: TextButton(onPressed: () {
                              Navigator.pop(context);    
                     
                             setState(() {
                               // result = false;
                               // email ='';
                               // password1 =''; 
                             });
                             }, child:  Text('OK', style: TextStyle(fontFamily: 'Montserrat')),),
                     ),             
                      
                    ],
                  ),
                ));
          });
        });
    throw Exception('Failed to download');
  }
}

  // Future<void> getjaon() async {
  //   var url = Uri.parse("https://smartfarmpro.com/v1/api/security/token");
  //   var resp = await http.post(url, 
   
  //   body: {
  //     "Grant_Type": 'password', "Username": 'Orange', "Password": "SmartFarm@Orange2022"
  //   });
  //   _loginDb=loginDbFromJson(resp.body);
  //   print(resp.body);
  //   setState(() {
  //     Token = _loginDb!.accessToken;
  //     loading = false;
  //   });
  // } 

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getToken();
    
    // _createSampleData();
  }

     final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;
    return Container(
  //      decoration:  BoxDecoration(
  //     image: DecorationImage(
  //         image: AssetImage("images/Artboard1.jpg"), 
  //         fit: BoxFit.fill),
  // ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: 
       SingleChildScrollView(
         physics: BouncingScrollPhysics(),
          child: Stack(
            
            children: [
               Container(
                 height: screenH!*1,
                 width: screenW!*1,
  //              decoration:  BoxDecoration(
  //     image: DecorationImage(
  //         image: AssetImage("assets/images/Artboard1.jpg"), 
  //         fit: BoxFit.fill),
  // ),
       decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.33),
            radius: 1.0,
            colors: <Color>[Colors.white, Colors.green],
          ),
        ),
            ),
              Container(
                  height: screenH!*1,
                 width: screenW!*1,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/B.jpg"), 
                      fit: BoxFit.fill),
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Column(
                        children: [
                         Container(
                           margin: EdgeInsets.only(top: 30),
                 height: screenH!*0.4,
                 width: screenW!*1,
               decoration:  BoxDecoration(
                //  color: Colors.amberAccent
      image: DecorationImage(
          image: AssetImage("images/B2.png"), 
          fit: BoxFit.fill),
  ),)
                      ]),
                    ),
                    Center(
                      // child: SingleChildScrollView(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            // SizedBox(
                            //   height: screenH!*0.35,
                            // ),
           buildLogin(),
           buildSignUp(),
             SizedBox(
                              height: screenH!*0.2,
                            ),

                     GestureDetector(
                       onTap: () {
                         
                       },
                       child: Text('Forgor Password ?',
          style: TextStyle(fontFamily: 'Montserrat',
              fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),),
                     ) ,  
                       SizedBox(
                              height: screenH!*0.05,
                            ),    
                          ],
                        ),
                      ),
                  ],
                ),
                ),
                
            ],
          ),
        ),
        // ),
      ),
    );
    // Scaffold(
    //   body: Container(
    //     decoration: BoxDecoration(
    //       gradient: RadialGradient(
    //         center: Alignment(0, -0.33),
    //         radius: 1.0,
    //         colors: <Color>[Colors.white, Colors.green],
    //       ),
    //     ),
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //        buildLogin(),
    //        buildSignUp(),
    //       ],),
    //     ),
    //   ),
    // );


    
  }

  Container buildLogo() {
    return Container(width: screenW! * 0.6,);
  }
route(){
  Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context)=> Summary(Token: Token),));
}
Home()async{
  var duration = Duration(seconds:3);
  return Timer(duration, route);

}

   Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenW! * 0.75,
      height: screenH! * 0.07,
      child: ElevatedButton(
        onPressed: () {
          try{
            showDialog(
        barrierColor: Color.fromARGB(255, 148, 174, 149).withOpacity(0.3),
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 270,
                  width: screenW! * 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15, left: 10),
                              height: screenH! * 0.06,
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Color(0xff44bca3)),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            //  color: Colors.white,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'X',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    newMethodEmail(),
                    newMethodPassword(),
                    newMethodLogin()
                      
                    ],
                  ),
                ));
          });
        });
            //  getToken();
          //print(loading);
    //       loading? CircularProgressIndicator()
    //       : 
    //       Navigator.pushReplacement(context, MaterialPageRoute(
    // builder: (context)=> Drawer1(Token: Token,User: Username,Password:Password,),));
          }catch(e){
            //print('e ===> ${e.toString()} ');  
          }
    
        },
        
        //  Navigator.pushNamed(context, '/showMapPresent'),
        child: Text('Log In',style: TextStyle(
          fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff35b499)
                  ),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }



     Container newMethodPassword() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcfcfcf), width: 1),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      height: 50,
      margin: EdgeInsets.only(top: 16),
      width: screenW! * 0.7,
      child: TextField(
        controller: _password1Controller,
         obscureText: true,
         obscuringCharacter: '???',
        // enableIMEPersonalizedLearning          :false,
        keyboardType: TextInputType.emailAddress,
         style: TextStyle(fontFamily: 'Montserrat',color:  Color.fromARGB(255, 0, 0, 0),fontSize: 16),
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.only(top: 10),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          hintText: '????????????????????????',
        hintStyle: TextStyle(fontFamily: 'THSarabun',color: Color.fromARGB(255, 0, 0, 0),fontSize: 23),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Color(0xffcfcfcf)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Color(0xffcfcfcf)),
          ),
        ),
      ),
    );
  }

  Container newMethodEmail() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcfcfcf), width: 1),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      height: 50,
      margin: EdgeInsets.only(top: 16),
      width: screenW! * 0.7,
      child: TextField(
         controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontFamily: 'Montserrat',color:  Color.fromARGB(255, 0, 0, 0),fontSize: 16),
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.only(top: 10),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.person_outline_rounded,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          hintText: '???????????????',
          hintStyle: TextStyle(fontFamily: 'THSarabun',color: Color.fromARGB(255, 0, 0, 0),fontSize: 23),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Color(0xffcfcfcf)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Color(0xffcfcfcf)),
          ),
        ),
      ),
    );
  }

  Container newMethodLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenW! * 0.7,
      height: 50,
      child: ElevatedButton(
        
        onPressed: () {
          getToken(_emailController.text,_password1Controller.text); 
          // getToken(_emailController.text,_password1Controller.text); 
        },

        child: Text(
          'Log in',
          style: TextStyle(fontFamily: 'Montserrat',
              fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        style: ElevatedButton.styleFrom(
            primary: Color(0xff35b499),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }

  
  Container buildSignUp() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenW! * 0.75,
      height: screenH! * 0.07,
       decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 3),
        borderRadius: BorderRadius.circular(30),
        // color: Colors.white,r
      ),
      child: ElevatedButton(
        onPressed: () {
         
        },
        //  Navigator.pushNamed(context, '/showMapPresent'),
        child: Text('Sign Up', style: TextStyle(
                     fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
        style: ElevatedButton.styleFrom(
            primary: Color(0xff35b499),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }



}