import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'recipients_model.dart';
export 'recipients_model.dart';

class RecipientsWidget extends StatefulWidget {
  const RecipientsWidget({super.key});

  @override
  State<RecipientsWidget> createState() => _RecipientsWidgetState();
}

class _RecipientsWidgetState extends State<RecipientsWidget> {
  late RecipientsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipientsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.recipients = await queryContactsRecordOnce(
        queryBuilder: (contactsRecord) => contactsRecord.where(
          'owner',
          isEqualTo: currentUserReference,
        ),
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
