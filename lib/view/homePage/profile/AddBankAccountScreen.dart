import 'package:Tukki/utils/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../config/Api.dart';
import '../../../config/http_service.dart';
import '../../../customWidgets/customWidget.dart';
import '../../../model/InsertDataAccount.dart';
import '../../../workspace.dart';
import 'package:get/get.dart';

class AddBankAccountScreen extends StatefulWidget {
  const AddBankAccountScreen({super.key});

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {

  TextEditingController textEditingControllerBankName=TextEditingController();
  TextEditingController textEditingControllerBranchName=TextEditingController();
  TextEditingController textEditingControllerAcc=TextEditingController();
  TextEditingController textEditingControllerAccName=TextEditingController();
  TextEditingController textEditingControllerIBAN=TextEditingController();
  TextEditingController textEditingControllerSwift=TextEditingController();
  GlobalKey<FormState> globalKey=GlobalKey();

  InsertDataAccount? insertDataAccount;
  bool shouldLoad=false;

  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    var res=await httpPost(Config.getBankAccount, {});
    if(res!=null){
      insertDataAccount=InsertDataAccount.fromJson(res);
      if(insertDataAccount!.data!=null){
        textEditingControllerAccName.text=insertDataAccount!.data!.data!.accountName!;
        textEditingControllerAcc.text=insertDataAccount!.data!.data!.accountNumber!;
        textEditingControllerBankName.text=insertDataAccount!.data!.data!.bankName!;
        textEditingControllerBranchName.text=insertDataAccount!.data!.data!.branchName!;
        textEditingControllerIBAN.text=insertDataAccount!.data!.data!.iban!;
        textEditingControllerSwift.text=insertDataAccount!.data!.data!.swiftCode!;
      }
    }
    shouldLoad=true;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: CustomTheme.theamColor,elevation: 0,centerTitle: true,title: Text("Add Bank Account"),),
      body: !shouldLoad?Center(child: CircularProgressIndicator()):SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(key: globalKey,
            child: Column(mainAxisSize: MainAxisSize.min,children: [
              TextFormField(controller: textEditingControllerAccName,decoration: InputDecoration(hintText: "Account Name",label: Text("Account Name"),border: OutlineInputBorder()),validator: (value){
                if(value!=null && value.isEmpty){
                  return "Account Name is Empty";
                }
                return null;
              },autovalidateMode: AutovalidateMode.onUserInteraction,),
              const SizedBox(height: 16,),

              TextFormField(controller: textEditingControllerAcc,decoration: InputDecoration(hintText: "Account Number",label: Text("Account Number"),border: OutlineInputBorder()),validator: (value){
                if(value!=null && value.isEmpty){
                  return "Account number is Empty";
                }
                return null;
              },autovalidateMode: AutovalidateMode.onUserInteraction,),
              const SizedBox(height: 16,),

              TextFormField(controller: textEditingControllerBankName,decoration: InputDecoration(hintText: "Bank Name",label: Text("Bank Name"),border: OutlineInputBorder()),validator: (value){
                if(value!=null && value.isEmpty){
                  return "Bank Name is Empty";
                }
                return null;
              },autovalidateMode: AutovalidateMode.onUserInteraction,),
              const SizedBox(height: 16,),

              TextFormField(controller: textEditingControllerBranchName,decoration: InputDecoration(hintText: "Branch Name",label: Text("Branch Name"),border: OutlineInputBorder()),validator: (value){
                if(value!=null && value.isEmpty){
                  return "Branch Name is Empty";
                }
                return null;
              },autovalidateMode: AutovalidateMode.onUserInteraction,),

              SizedBox(height: 16,),TextFormField(controller: textEditingControllerIBAN,decoration: InputDecoration(hintText: "IBAN Name",label: Text("IBAN Name"),border: OutlineInputBorder()),validator: (value){
                if(value!=null && value.isEmpty){
                  return "IBAN is Empty";
                }
                return null;
              },autovalidateMode: AutovalidateMode.onUserInteraction,),
              SizedBox(height: 16,),TextFormField(controller: textEditingControllerSwift,decoration: InputDecoration(hintText: "SWIFT/BIC Code",label: Text("SWIFT/BIC Name"),border: OutlineInputBorder()),validator: (value){
                if(value!=null && value.isEmpty){
                  return "SWIFT/BIC Code is Empty";
                }
                return null;
              },autovalidateMode: AutovalidateMode.onUserInteraction,),
              SizedBox(height: 16,),
              InkWell(onTap: (){
                submit();
              },child: Container(width: MediaQuery.of(context).size.width,padding: EdgeInsets.all(16),decoration: BoxDecoration(color: CustomTheme.theamColor,borderRadius: BorderRadius.circular(10)),child: Center(child: Text( "Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)))),

            ],),
          ),
        ),
      ),
    );
  }
  submit() async {
    if(!globalKey.currentState!.validate()){
      return;
    }

    var map={
      "account_name":textEditingControllerAccName.text,
      "bank_name":textEditingControllerBankName.text,
      "branch_name":textEditingControllerBranchName.text,
      "account_number":textEditingControllerAcc.text,
      "iban":textEditingControllerIBAN.text,
      "swift_code":textEditingControllerSwift.text,
    };
    showLoading();
    var response=await httpPost(Config.insertBankAccount, map);
    closeLoading();
    if(response!=null){
      InsertDataAccount insertDataAccount=InsertDataAccount.fromJson(response);
      print(insertDataAccount.data!.data!.accountName);
      if(insertDataAccount.status==200){
        showToastMessage(insertDataAccount.message);
        Navigator.pop(context);
      }else{
        showErrorToastMessage(insertDataAccount.error);
      }
    }
  }
}
