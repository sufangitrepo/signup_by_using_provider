
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/signup_provider.dart';
class FirstPage extends StatelessWidget {


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
   String value = 'male';
  String maleValue = 'male';
  String femaleValue = 'female';

  FirstPage({Key? key}) : super(key: key);
  Size ?  size ;
  @override
  Widget build(BuildContext context) {
    size =  MediaQuery.of(context).size;
     SignupProvider provider = context.read<SignupProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Column(
        children: [
          Spacer(flex: 5,),
          Expanded(child: setField('enter name', nameController,TextInputType.text),flex: 10,),
          Spacer(flex: 5,),
          Expanded(child: setField('enter Email', emailController,TextInputType.emailAddress),flex: 10,),
          Spacer(flex: 5,),
          Expanded(child: setField('enter phone number', phoneNoController,TextInputType.phone),flex: 10,),
          Spacer(flex: 5,),
          Expanded(child: setField('password', passwordController, TextInputType.visiblePassword,true),flex: 10,),
          Spacer(flex: 5,),
          Expanded(child: setField('confirm password', confirmPasswordController, TextInputType.visiblePassword,true),flex: 10,),
          Spacer(flex: 5,),
          Expanded(child:SizedBox(
            width: size!.width*.8,
            child: Selector<SignupProvider,String>(builder: (context , value , child)=>
                RadioListTile(value: maleValue,title:Text('male'), groupValue: value, onChanged: (object){
                  provider.checkMail(object!);
                })
                , selector: (context, sign){return sign.value;}),
          ),flex:5 ,),

          Expanded(child: SizedBox(
            width: size!.width*.8,
            child: Selector<SignupProvider,String>(
              selector:(context, signup) => signup.value  ,
              builder: ( context ,value,   child ){return RadioListTile(value: femaleValue, groupValue: value,title: Text('female'),
                  onChanged: (object){
                     provider.checkFemale(object!);

                  });
                },
            ),
          ),flex: 5,),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(onPressed: () async{
              String data = nameController.text;
              provider.submitClick(data, emailController.text, phoneNoController.text, passwordController.text, confirmPasswordController.text);
              await showDialog(context: context, builder:(context)=>AlertDialog(title:Text( nameController.text),actions: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Ok')),
              ],) );
              nameController.clear();
              emailController.clear();
              phoneNoController.clear();
              passwordController.clear();
              confirmPasswordController.clear();
              provider.setDefaultGender();

            },height: 100,minWidth: 200,color: Colors.blue,child: Text('Submit'),),
          ),flex: 10,),

        ],
      ),
    );
  }

  Widget setField(String hint ,TextEditingController controller,TextInputType inputType,[bool isVisible = false]){

    return SizedBox(
      width: size!.width*.8,

      child: TextField(
        controller: controller,
        obscureText: isVisible,
        keyboardType:inputType ,
        decoration:InputDecoration(

            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blue) )
        ),
      ),
    );
  }
}
