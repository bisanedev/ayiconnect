import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';
import '../../components/form/Input_text.dart';
import '../../components/form/Input_like_text.dart';
import '../../components/form/Input_gender.dart';
import '../../components/phone_field/intl_phone_field.dart';

enum Gender { male, female, others }

class ScreenFormTwo extends StatelessWidget {  
  final Function? nextForm;
  final TextEditingController? fullNameController;
  final int? genderValue;
  final Function(int) genderRadio;  
  final String? calendarValue;
  final Function? calendarOnPressed;
  final String? phoneValue;  
  final Function(String) phoneOnChange;
  final String? addressValue;
  final Function? getLocation;   

  const ScreenFormTwo({Key? key,
    this.nextForm,
    this.fullNameController,    
    this.genderValue,
    required this.genderRadio,
    this.calendarValue,
    this.calendarOnPressed,
    this.phoneValue,    
    required this.phoneOnChange,
    this.addressValue,
    this.getLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final profileCard = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xfffefefe),
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.normal)),
              const InputLikeText(                    
                  iconData: Icons.add_a_photo,                  
                  value: "Add profile photo",
                  padding: EdgeInsets.all(12.0),                 
              ),
              const SizedBox(height: 5),
              Text('Add a profile to make it more personal,\nIt makes a difference!',textAlign: TextAlign.start,style:TextStyle(fontSize: 13 ,color: globals.fontColor,fontWeight: FontWeight.normal)),
            ],
          )
        )       
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,   
      children:<Widget>[
        profileCard, 
        const SizedBox(height: 19),     
        Container(height:1,width:double.infinity,color: globals.formColorBorder),
        const SizedBox(height: 19),
        Container(height:1,width:double.infinity,color: globals.formColorBorder),
        const SizedBox(height: 15),       
        Text('Full Name',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputText(
          hintText: "Your full name",
          controller: fullNameController,
        ),
        const SizedBox(height: 15),
        Text('Select Your Gender',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),   
        InputGender(
          gender:genderValue,
          onPressed:(int val) {
            genderRadio(val);
          }                   
        ),
        const SizedBox(height: 15),
        Text('Choose Your Date of Birth',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputLikeText(                    
          iconData: Icons.calendar_month_outlined,
          hintText: "MM/DD/YYYY",
          value: calendarValue,                
          onPressed:calendarOnPressed as void Function()?
        ),
        const SizedBox(height: 15),
        Text('Phone Number',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        IntlPhoneField(
            decoration: InputDecoration( 
                  contentPadding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0), 
                  fillColor: Colors.white,
                  filled: true,                              
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.125)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder:OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: globals.firstColor),
                      borderRadius: BorderRadius.circular(8),
                  )
            ),
            initialCountryCode: 'ID',            
            onChanged: (phone) {              
                phoneOnChange(phone.completeNumber);
            },
        ),
        const SizedBox(height: 15),
        Text('Current Location',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputLikeText(         
          iconData: Icons.gps_fixed,
          hintText: "Where Your Are",
          value: addressValue,                
          onPressed: getLocation as void Function()?
        ),
        const SizedBox(height: 25),
        SizedBox(
            width:double.infinity,                      
            child:SimpleElevatedButton(
                color: globals.firstColor,
                borderRadius: 10,
                onPressed: nextForm as void Function()?,
                child: Text("Next",style:TextStyle(fontSize: 18 ,color: Colors.white,fontWeight: FontWeight.normal))                  
            )
        )             
      ]
    );
  }
}