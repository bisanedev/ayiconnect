import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
  TextEditingController fullNameController = TextEditingController();   
  DateTime now = new DateTime.now();
  //VoidCallback? _onStepCancel;
  /*--- register form variable ---*/
  int? role;
  String? fullName;
  int? gender;
  DateTime? dateBirth;
  String? phoneNumber;
  String? currentLoc;
  String? occupation;
  String? company;
  List<int>? spoken;
  int? service;
  String? aboutYou;
  /*--- end of register form variable ---*/

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
                      title: Text('Select\n Your Role',style: TextStyle(fontSize: 8,color: _currentStep >= 0 ? Colors.white:const Color(0xffe5e5ea)),textAlign: TextAlign.center),                      
                      content:  ScreenFormOne(
                          roleSelected: role,
                          selectHelper:() {
                            setState(() { role=0; } );
                            _onStepContinue!();
                          },
                          selectJob:() {
                            setState(() {role=1; });
                            _onStepContinue!();                          
                          }
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ? StepStateX.complete : StepStateX.disabled,
                    ),
                    StepX(
                      title: Text('Personal Information',style: TextStyle(fontSize: 8,color:  _currentStep >= 1 ? Colors.white:const Color(0xffe5e5ea)),textAlign: TextAlign.center),
                      content: ScreenFormTwo(
                        fullNameController:fullNameController,                        
                        nextForm:() {
                          _onStepContinue!();
                        },
                        calendarOnPressed:(){
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1930, 3, 5),
                              maxTime: DateTime(now.year, now.month, now.day),                            
                              onConfirm: (date) {                                
                                setState(() {
                                  dateBirth = date;
                                });
                              }, 
                              currentTime: DateTime.now(), 
                              locale: LocaleType.en
                          );
                        }
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2 ? StepStateX.complete : StepStateX.disabled,
                    ),
                    StepX(
                      title: Text('Professional Information',style: TextStyle(fontSize: 8,color:  _currentStep >= 2 ? Colors.white:const Color(0xffe5e5ea)),textAlign: TextAlign.center),
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