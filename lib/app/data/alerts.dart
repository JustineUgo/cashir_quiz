import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizAlerts{

  void success(String successText, BuildContext context){
    CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: successText,
          // autoCloseDuration: Duration(seconds: 2),
    );
  }

  void error(String errorTitle, String errorText, BuildContext context){
    CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: errorTitle,
          text: errorText,
          loopAnimation: false,
    );
  }

  void warning(String warningText, BuildContext context){
    CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          text: warningText,
    );
  }

  void info(String infoText, BuildContext context){
    CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          text: infoText,
    );
  }

  void confirm(String question, accept, cancel, Function()? onConfirm, Function()? onCancel, BuildContext context){
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: question,
        confirmBtnText: accept,
        cancelBtnText: cancel,
        confirmBtnColor: Colors.green,
        onCancelBtnTap: onCancel,
        onConfirmBtnTap: onConfirm
    );
  }

  void loading(BuildContext context){
    CoolAlert.show(
          context: context,
          type: CoolAlertType.loading,
    );
  }

}