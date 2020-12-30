import 'package:flutter/material.dart';
import 'package:mvvm_poc/mvvm/formViewModel.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  TextEditingController controller = TextEditingController();
  FormViewModel _formViewModel = FormViewModel();

  @override
  void initState() {
    controller.addListener(() => _formViewModel.inputEmail.add(controller.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              controller: controller,
            ),
            StreamBuilder<String>(
              stream: _formViewModel.outputErro,
              builder: (context, snapshot) {
                return Text(snapshot?.data ?? "");
              },
            ),
            StreamBuilder<bool>(
              stream: _formViewModel.outputBotaoHabilitado,
              builder: (context, snapshot) {
                return RaisedButton(
                  child: Text("Enviar"),
                  onPressed: (snapshot.data ?? false) ? () {} : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
