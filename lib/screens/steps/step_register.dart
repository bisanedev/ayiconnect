import 'package:flutter/material.dart';
import '../../components/stepper/custom_stepper.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
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
                    return Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: dtl.onStepContinue,
                          child: Text('NEXT'),
                        ),
                        TextButton(
                          onPressed: dtl.onStepCancel,
                          child: Text(''),
                        ),
                      ],
                    ); 
                  },
                  steps: <StepX>[
                    StepX(
                      title: Text('Select Your Role',style: TextStyle(fontSize: 8),textAlign: TextAlign.center),                      
                      content: screenFormOne(),                    
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0 ? StepStateX.complete : StepStateX.disabled,
                    ),
                    StepX(
                      title: Text('Personal Information',style: TextStyle(fontSize: 8),textAlign: TextAlign.center),
                      content: screenFormTwo(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ? StepStateX.complete : StepStateX.disabled,
                    ),
                    StepX(
                      title: Text('Professional Information',style: TextStyle(fontSize: 8),textAlign: TextAlign.center),
                      content: screenFormThree(),
                      isActive:_currentStep >= 0,
                      state: _currentStep >= 2 ? StepStateX.complete : StepStateX.disabled,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
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