import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
  print("App launched");
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'EmpowerED',
      theme:ThemeData(scaffoldBackgroundColor:Colors.white),
      home:Splash1(),
    );
  }
}

PreferredSizeWidget appbar(String t)=>AppBar(
  title:Text(t),
  centerTitle:true,
  backgroundColor:Colors.white,
  foregroundColor:Colors.black,
  elevation:0,
);

Widget input(String label,TextEditingController ctrl,{bool hidden=false,String type="text"}){
  IconData icon=Icons.text_fields;
  if(type=="email")icon=Icons.email_outlined;
  if(type=="phone")icon=Icons.phone_android;
  if(type=="password")icon=Icons.lock_outline;

  return Padding(
    padding:const EdgeInsets.only(bottom:14),
    child:Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children:[
        Text(label,style:const TextStyle(fontSize:15,fontWeight:FontWeight.w500)),
        const SizedBox(height:6),
        TextField(
          controller:ctrl,
          obscureText:hidden,
          decoration:InputDecoration(
            prefixIcon:Icon(icon,color:Colors.amber),
            contentPadding:const EdgeInsets.symmetric(vertical:14,horizontal:14),
            border:OutlineInputBorder(borderRadius:BorderRadius.circular(8)),
          ),
        ),
      ],
    ),
  );
}

Widget button({required String text,required VoidCallback tap,bool outline=false}){
  return Padding(
    padding:const EdgeInsets.only(bottom:10),
    child:outline
        ?OutlinedButton(
      onPressed:tap,
      style:OutlinedButton.styleFrom(
        side:const BorderSide(color:Colors.amber,width:2),
        minimumSize:const Size(double.infinity,48),
      ),
      child:Text(text,style:const TextStyle(fontSize:16,color:Colors.black)),
    )
        :ElevatedButton(
      onPressed:tap,
      style:ElevatedButton.styleFrom(
        backgroundColor:Colors.amber,
        minimumSize:const Size(double.infinity,48),
      ),
      child:Text(text,style:const TextStyle(fontSize:16)),
    ),
  );
}

Widget intro(String text)=>Padding(
  padding:const EdgeInsets.only(bottom:20),
  child:Text(text,
    textAlign:TextAlign.center,
    style:const TextStyle(fontSize:14,color:Colors.black54,height:1.4),
  ),
);

// 1
class Splash1 extends StatefulWidget{
  @override
  State<Splash1> createState()=>_Splash1State();
}

class _Splash1State extends State<Splash1>{
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds:3),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>Splash2()));
    });
  }

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            CircleAvatar(
              radius:48,
              backgroundColor:Colors.amber,
              child:Text("ED",style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),
            ),
            SizedBox(height:15),
            Text("EmpowerED",style:TextStyle(fontSize:22)),
          ],
        ),
      ),
    );
  }
}

// 2
class Splash2 extends StatelessWidget{
  const Splash2({super.key});
  @override
  Widget build(BuildContext context){
    final h=MediaQuery.of(context).size.height;
    print("Splash2 opened");
    return Scaffold(
      body:SafeArea(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            Padding(
              padding:const EdgeInsets.only(top:40,bottom:20),
              child:Image.asset('assets/images/online_education.png',
                height:h*0.35,fit:BoxFit.contain,
              ),
            ),
            const Text("Welcome to",style:TextStyle(fontSize:22,color:Colors.black54)),
            const SizedBox(height:6),
            const Text("MyCourses",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold)),
            const SizedBox(height:40),
            button(text:"Login",tap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>Login()))),
            button(text:"Already have an account?",outline:true,
                tap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>Register()))),
          ],
        ),
      ),
    );
  }
}

// 3
class Register extends StatelessWidget{
  final email=TextEditingController();
  final phone=TextEditingController();
  final pass=TextEditingController();
  final confirm=TextEditingController();

  Register({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:appbar("Create Account"),
      body:Padding(
        padding:const EdgeInsets.all(20),
        child:Column(
          children:[
            intro("Enjoy the various best courses we have, choose the category according to your wishes."),
            input("Email Address",email,type:"email"),
            input("Phone Number",phone,type:"phone"),
            input("Password",pass,type:"password",hidden:true),
            input("Confirm Password",confirm,type:"password",hidden:true),
            const SizedBox(height:10),
            button(text:"Create Account",tap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>Login()))),
          ],
        ),
      ),
    );
  }
}

// 4
class Login extends StatelessWidget{
  final email=TextEditingController();
  final pass=TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:appbar("Login"),
      body:Padding(
        padding:const EdgeInsets.all(20),
        child:Column(
          children:[
            intro("Hello, Welcome back to My Courses"),
            input("Email Address",email,type:"email"),
            input("Password",pass,type:"password",hidden:true),
            Align(
              alignment:Alignment.centerRight,
              child:TextButton(
                  onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>Reset1())),
                  child:const Text("Forgot password?")
              ),
            ),
            button(text:"Login",tap:(){}),
          ],
        ),
      ),
    );
  }
}

// 5
class Reset1 extends StatelessWidget{
  final mail=TextEditingController();
  Reset1({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:appbar("Reset Password"),
      body:Padding(
        padding:const EdgeInsets.all(20),
        child:Column(
          children:[
            input("Email",mail,type:"email"),
            button(text:"Send Me a New Password",tap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>Reset2()))),
          ],
        ),
      ),
    );
  }
}

// 6
class Reset2 extends StatelessWidget{
  final newPass=TextEditingController();
  final confirm=TextEditingController();

  Reset2({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:appbar("Reset Password"),
      body:Padding(
        padding:const EdgeInsets.all(20),
        child:Column(
          children:[
            intro("Please fill in the field below to reset your current password."),
            input("New Password",newPass,type:"password",hidden:true),
            input("Confirm Password",confirm,type:"password",hidden:true),
            button(text:"Confirm Reset Password",tap:(){}),
          ],
        ),
      ),
    );
  }
}
