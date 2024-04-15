import '/flutter_flow/flutter_flow_util.dart';
import 'auth_page_widget.dart' show AuthPageWidget;
import 'package:flutter/material.dart';

class AuthPageModel extends FlutterFlowModel<AuthPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for registerEmailAddress widget.
  FocusNode? registerEmailAddressFocusNode;
  TextEditingController? registerEmailAddressController;
  String? Function(BuildContext, String?)?
      registerEmailAddressControllerValidator;
  String? _registerEmailAddressControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for registerPassword widget.
  FocusNode? registerPasswordFocusNode;
  TextEditingController? registerPasswordController;
  late bool registerPasswordVisibility;
  String? Function(BuildContext, String?)? registerPasswordControllerValidator;
  String? _registerPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  String? _confirmPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    registerEmailAddressControllerValidator =
        _registerEmailAddressControllerValidator;
    registerPasswordVisibility = false;
    registerPasswordControllerValidator = _registerPasswordControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordControllerValidator = _confirmPasswordControllerValidator;
    emailAddressControllerValidator = _emailAddressControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    registerEmailAddressFocusNode?.dispose();
    registerEmailAddressController?.dispose();

    registerPasswordFocusNode?.dispose();
    registerPasswordController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }
}
