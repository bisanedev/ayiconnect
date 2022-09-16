import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/stepper/custom_stepper.dart';
import '../../components/widget/header_stepper.dart';
import '../../components/form/button.dart';
import './screen_form_one.dart';
import './screen_form_two.dart';
import './screen_form_three.dart';

class StepRegisterScreen extends StatefulWidget {  
  const StepRegisterScreen({Key? key}) : super(key: key);

  @override
  _StepRegisterScreen createState() => _StepRegisterScreen();
}

class _StepRegisterScreen extends State<StepRegisterScreen> {
  int _currentStep = 0;  
  VoidCallback? _onStepContinue;
  VoidCallback? _onStepCancel;

  @override
  Widget build(BuildContext context) {    

    return Scaffold(
        appBar: HeaderStepper(),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: StepperCustom(                  
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: null,
                  controlsBuilder: (BuildContext ctx, ControlsDetailsX dtl){
                    _onStepContinue = dtl.onStepContinue;
                    _onStepCancel = dtl.onStepCancel;
                    return SizedBox.shrink();                    
                  },
                  steps: <StepX>[
                    StepX(
                      title: Text('Select\n Your Role',style: TextStyle(fontSize: 8,color: _currentStep >= 0 ? Colors.white:Color(0xffe5e5ea)),textAlign: TextAlign.center),                      
                      content:  screenFormOne(
                          selectHelper:() {
                            _onStepContinue!();
                          },
                          selectJob:() {
                            _onStepContinue!();                          
                          }
                      ),                    
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ? StepStateX.complete : StepStateX.disabled,
                    ),
                    StepX(
                      title: Text('Personal Information',style: TextStyle(fontSize: 8,color:  _currentStep >= 1 ? Colors.white:Color(0xffe5e5ea)),textAlign: TextAlign.center),
                      content: screenFormTwo(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2 ? StepStateX.complete : StepStateX.disabled,
                    ),
                    StepX(
                      title: Text('Professional Information',style: TextStyle(fontSize: 8,color:  _currentStep >= 2 ? Colors.white:Color(0xffe5e5ea)),textAlign: TextAlign.center),
                      content: screenFormThree(),
                      isActive:_currentStep >= 0,
                      state: _currentStep >= 3 ? StepStateX.complete : StepStateX.disabled,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  submit(){
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