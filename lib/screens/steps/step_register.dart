import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import '../../globals.dart' as globals;
import '../../components/stepper/custom_stepper.dart';
import '../../components/widget/header_stepper.dart';
import './screen_form_one.dart';
import './screen_form_two.dart';
import './screen_form_three.dart';
import './language_model.dart';
import './services_model.dart';

class StepRegisterScreen extends StatefulWidget {  
  const StepRegisterScreen({Key? key}) : super(key: key);

  @override
  State<StepRegisterScreen> createState() => _StepRegisterScreen();
}

class _StepRegisterScreen extends State<StepRegisterScreen> {
  int _currentStep = 0;  
  VoidCallback? _onStepContinue;  
  DateTime now = DateTime.now();
  DateFormat calendarFormat = DateFormat("dd/MM/yyyy");
  DateTime? currentDateBirth;
  //VoidCallback? _onStepCancel;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  /*--- register form variable ---*/
    int? role;
    TextEditingController fullName = TextEditingController();
    int? gender;
    String? dateBirth;
    String? phoneNumber;
    String? currentLoc;
    TextEditingController occupation = TextEditingController();
    TextEditingController company = TextEditingController();    
    List spoken = [];
    int? service;
    TextEditingController aboutYou = TextEditingController();  
  /*--- EOF register form variable ---*/
  /*--- select&multi options datas variable ---*/
  static List<Language> language = [
    Language(id: 1, name: "English"),
    Language(id: 2, name: "Mandarin"),
    Language(id: 3, name: "Spanish"),
  ];
   static List<Services> services = [
    Services(id: 1, name: "Child Care"),
    Services(id: 2, name: "Senior Care"),
    Services(id: 3, name: "Home Care"),
    Services(id: 3, name: "Other Services"),
  ];
  /*--- EOF select&multi options  datas variable ---*/
  @override  
  void initState() {        
    super.initState();
    _getCurrentPosition();
  }  

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
        appBar: const HeaderStepper(),
        body: Column(
            children: [
              Expanded(
                child: StepperCustom(                  
                  physics: const ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: null,
                  controlsBuilder: (BuildContext ctx, ControlsDetailsX dtl){
                    _onStepContinue = dtl.onStepContinue;
                    //_onStepCancel = dtl.onStepCancel;
                    return const SizedBox.shrink();                    
                  },
                  steps: <StepX>[
                    StepX(
                      title: Text('Select Your Role',style: TextStyle(fontSize:  11,color: _currentStep >= 0 ? Colors.white:const Color(0xffe5e5ea)),textAlign: TextAlign.center),                      
                      content:  ScreenFormOne(
                          roleSelected: role,
                          onPressed:(int value) {
                              setState(() { role=value; } );
                              _onStepContinue!();
                          }                     
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ? StepStateX.complete : StepStateX.disabled,
                    ),
                    StepX(
                      title: Text('Personal Information',style: TextStyle(fontSize:  11,color:  _currentStep >= 1 ? Colors.white:const Color(0xffe5e5ea)),textAlign: TextAlign.center),
                      content: ScreenFormTwo(
                        fullNameController:fullName,                        
                        nextForm:() {
                          _onStepContinue!();
                        },
                        genderValue:gender,
                        genderRadio: (int value) {
                          setState(() {
                            gender = value;
                          });
                        },
                        calendarValue:dateBirth,
                        calendarOnPressed:(){
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1930, 3, 5),
                              maxTime: DateTime(now.year, now.month, now.day),                            
                              onConfirm: (date) {  
                                String stringDate = calendarFormat.format(date);                            
                                setState(() {
                                  dateBirth = stringDate;
                                  currentDateBirth = date;
                                });
                              }, 
                              currentTime: currentDateBirth, 
                              locale: LocaleType.en
                          );
                        },
                        phoneValue:phoneNumber,
                        phoneOnChange:(String value) {
                          setState(() {
                            phoneNumber = value;
                          });
                        },
                        addressValue:currentLoc,
                        getLocation:(){                          
                          _getCurrentPosition();
                        }
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2 ? StepStateX.complete : StepStateX.disabled,
                    ),
                    StepX(
                      title: Text('Professional Information',style: TextStyle(fontSize:  11,color:  _currentStep >= 2 ? Colors.white:const Color(0xffe5e5ea)),textAlign: TextAlign.center),
                      content: ScreenFormThree(
                        occupationController:occupation,
                        companyController:company,                        
                        aboutYouController:aboutYou,
                        submitForm:(){
                          submitForm();
                        },
                      ),
                      isActive:_currentStep >= 0,
                      state: _currentStep >= 3 ? StepStateX.complete : StepStateX.disabled,
                    ),
                  ],
                ),
              ),
            ],
          ),  
    );
  }

  submitForm(){
    print("Sending...");
    print(role == 0 ? "FindJob":"FindHelper");
    print(fullName.text);
    print(gender == 0 ? "Male" : gender == 1 ? "Female":"Others"); 
    print(dateBirth);
    print(phoneNumber);
    print(currentLoc);
    print(occupation.text);
    print(company.text);    
    print(aboutYou.text);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
        setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
        setState(() => _currentStep -= 1) : null;
  }
  /*--- Geolocation ---*/ 
  Future<void> _getCurrentPosition() async {    
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await _geolocatorPlatform.getCurrentPosition(); 
    getAddressFromLatLong(position);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    //print(placemarks);
    Placemark place = placemarks[0];
    // String Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    // print(Address);  
    String Address = place.subAdministrativeArea! +", "+ place.country!;  
    setState(() {
      currentLoc = Address;
    });
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
  /*--- EOF ---*/
}