import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../../globals.dart' as globals;
import '../../components/stepper/custom_stepper.dart';
import '../../components/widget/header_stepper.dart';
import './screen_form_one.dart';
import './screen_form_two.dart';
import './screen_form_three.dart';

enum Gender { male, female, others }

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
  /*--- register form variable ---*/
  int? role;
  TextEditingController fullName = TextEditingController();
  int? gender;
  String? dateBirth;
  String? phoneNumber;
  String? currentLoc;
  String? occupation;
  String? company;
  List<int>? spoken;
  int? service;
  String? aboutYou;
  /*--- EOF register form variable ---*/

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
                      title: Text('Select\nYour Role',style: TextStyle(fontSize:  11,color: _currentStep >= 0 ? Colors.white:const Color(0xffe5e5ea)),textAlign: TextAlign.center),                      
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
                        }
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2 ? StepStateX.complete : StepStateX.disabled,
                    ),
                    StepX(
                      title: Text('Professional Information',style: TextStyle(fontSize:  11,color:  _currentStep >= 2 ? Colors.white:const Color(0xffe5e5ea)),textAlign: TextAlign.center),
                      content: ScreenFormThree(
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
    print(fullName.text);
    print(gender == 0 ? "Male" : gender == 1 ? "Female":"Others"); 
    print(dateBirth);
    print(phoneNumber);
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
}