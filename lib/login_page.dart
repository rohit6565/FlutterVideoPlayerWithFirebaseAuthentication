import 'package:hello/material.dart';
import 'package:hello/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<Statefulwidget> createState() => new _LoginPageState();
}

enum FormType{
  login,
  register
}

class _LoginPageState extends State<loginPage> {

  final formKey =new GlobalKey<formState>{};

  String _email
  String _password;
  FormType _formType=FormType.login();


  bool validateandSave()
  {
    final form=formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async{
    if(validateandSave())
    {
      try{
        if(_formType==FormType.login){
          FirebaseUser user=await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email,password:_password)
          print('Signed in:${user.uid}');
        }
        else{
          FirebaseUser user=await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email,password:_password)
          print('Signed in:${user.uid}');
        }
      }
      catch(e){
        print('Error:$e');
      }
    }
  }

  void moveToRegister(){
    formKey.currentState.reset();
    setState((){
      _formType=FormType.register;
    });
  }

  void moveToLogin(){
    setState((){
      _formType=FormType.login;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login Page'),
      ),
      body: new Container(
        padding:EdgeInsets.all(16.0),
        child: new Form(
          key:formKey,
          child: new Column(
            children:buildInputs()+buildSubmitButton(),
          ),
        )
      ),
    );

    List<Widget>buildInputs(){
      return[
        new TextFormField(
                decoration:new InputDecoration(labelText:'Email'),
                validator:(value)=>value.isEmpty?'Email can\'t be empty':null
                onSaved:(value) =>_email=value,
              )
              new TextFormField(
                deccoration:new InputDecoration(lableText:'Password');
                onSaved:(value) =>_password=value,
                obscureText: true,
              ),
      ];
    }
    
    Lits<Widget>buildSubmitButtons(){
      if(_formType==FormType.login)
      {
        return[
            new RaisedButton(
                    child:new Text('Login')
                    onPressed:validateAndSubmit(),
                  ),
                  new FlatButton(
                    child:new Text('Create an account',style:new TextStyle(fontSize:20),)
                    onPressed:moveToRegister(),
                  )
            ];      
      }
      else{
        return[
        new RaisedButton(
                child:new Text('Create an account')
                onPressed:validateAndSubmit(),
              ),
              new FlatButton(
                child:new Text('Have an account?Login',style:new TextStyle(fontSize:20),)
                onPressed:moveToLogin(),
              )
      ];
      }
    }
  }
}
