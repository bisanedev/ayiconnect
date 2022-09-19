import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/forms.dart';
import '../../components/dropdown/dropdown_button2.dart';
import './language_model.dart';
import './services_model.dart';


class ScreenFormThree extends StatelessWidget { 
  final Function? submitForm; 
  final TextEditingController? occupationController;
  final TextEditingController? companyController;
  final List<Language> languageItems;
  final List<Language> languageValue;
  final Function(List<Language>) languageOnChange;
  final List<Services> serviceItems;
  final Services? serviceValue;
  final Function(Services?) serviceOnChange;
  final TextEditingController? aboutYouController;

  const ScreenFormThree({
    Key? key,
    this.submitForm,
    this.occupationController,
    this.companyController,            
    required this.languageItems,
    required this.languageValue,
    required this.languageOnChange,
    required this.serviceItems,
    this.serviceValue,
    required this.serviceOnChange,
    this.aboutYouController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,  
      children:<Widget>[        
        Text('Occupation',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputText(
          hintText: "Add your occupation",
          controller: occupationController,
        ), 
        const SizedBox(height: 15),
        Text('Company',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputText(
          hintText: "Add your company name",
          controller: companyController,
        ), 
        const SizedBox(height: 15),
        Text('Fluently spoken language(s)',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Add Language',
                style: TextStyle(
                  fontSize: globals.fontSizeOther,
                  color:const Color.fromRGBO(0, 0, 0, 0.425),
                ),
              ),
            ),
            items: languageItems.map((item) {
              return DropdownMenuItem<Language>(
                value: item,
                //disable default onTap to avoid closing menu when selecting an item
                enabled: false,
                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final _isSelected = languageValue.contains(item);
                    return InkWell(
                      onTap: () {
                        _isSelected
                                ? languageValue.remove(item)
                                : languageValue.add(item);
                        //This rebuilds the StatefulWidget to update the button's text                        
                        languageOnChange(languageValue);
                        //This rebuilds the dropdownMenu Widget to update the check mark
                        menuSetState(() {});
                      },
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            _isSelected
                                    ? const Icon(Icons.check_box_outlined)
                                    : const Icon(Icons.check_box_outline_blank),
                            const SizedBox(width: 16),
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
            //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
            value: languageValue.isEmpty ? null : languageValue.last,
            onChanged: (value) {},
            buttonHeight: 60,
            buttonWidth: double.infinity,
            itemHeight: 40,
            icon: const Icon(
              Icons.add,
            ),
            iconSize: 28,
            iconEnabledColor: globals.formColorBorder,
            buttonPadding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),            
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 0.125),
              ),
              color: Colors.white,
            ),
            itemPadding: EdgeInsets.zero,
            selectedItemBuilder: (context) {
              return languageItems.map(
                  (item) {
                  return Container(
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      languageValue.join(', '),
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  );
                },
              ).toList();
            },
          ),
        ),
        const SizedBox(height: 15),
        Text('Prefered Service',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Text(
              'Add your prefered service',
              style: TextStyle(
                fontSize: globals.fontSizeOther,
                color: const Color.fromRGBO(0, 0, 0, 0.425),
              ),
            ),
            items: serviceItems
                    .map((item) =>
                    DropdownMenuItem<Services>(
                      value: item,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: globals.fontSizeOther,
                        ),
                      ),
                    ))
                    .toList(),
            value: serviceValue,
            onChanged: (value) {
              serviceOnChange(value); 
            },
            buttonHeight: 60,
            buttonWidth: double.infinity,
            itemHeight: 40,
            iconSize: 28,
            iconEnabledColor: globals.formColorBorder,
            buttonPadding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),            
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 0.125),
              ),
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text('Tell us about you',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputText(
          hintText:"Provide some brief about yourself, so helper can get to know your a litle better before your connection.",
          isMultiline: true,
          maxLines:4,          
          controller: aboutYouController,
          maxLength:100,
        ), 
        const SizedBox(height: 25),     
        SizedBox(
          width:double.infinity,                      
          child:SimpleElevatedButton(
              color: globals.firstColor,
              borderRadius: 10,              
              onPressed: submitForm as void Function()?,
              child: const Text("Submit",style:TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal)),
          )
        ) 
      ]
    );
  }
}