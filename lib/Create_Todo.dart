import "package:flutter/material.dart";

class CreateTodo extends StatefulWidget {
  @override
  _CreateTodoState createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final _formKey = GlobalKey<FormState>();
  final double formWidth = 175.0;

  final Map<String, Icon> itemsMap = {
    'Heading': Icon(Icons.title),
    'Description': Icon(Icons.edit),
    'Date': Icon(Icons.calendar_today)
  };

  final items = ['Heading', 'Description', 'Date'];

  RaisedButton submitFormButton() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          Scaffold
              .of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
        }
      },
      child: Text('Submit'),
    );
  }

  _changeKeyboardType(entry) {
    if (entry == "Description") {
      return TextInputType.multiline;
    }

    return TextInputType.text;
  }

  ListView createListItems() {
    return ListView.builder(
      padding: EdgeInsets.only(
        left: 50.0,
        right: 50.0,
        top: 20.0
      ),
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) {
        var currentHeading = this.items[index];
        var currentIcon = this.itemsMap[currentHeading];

        return Padding(
          padding: EdgeInsets.only(bottom: 50.0),
          child: new TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'You must enter a ${currentHeading.toLowerCase()} for your to-do';
                }
              },
              keyboardType: this._changeKeyboardType(currentHeading),
              maxLines: 1,
              decoration: new InputDecoration(
                prefixIcon: currentIcon,
                labelText: currentHeading,
                border: OutlineInputBorder(),
              ),
            )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: true,
      child: Expanded(
        child: (this.createListItems())
      )
    );
  }
}