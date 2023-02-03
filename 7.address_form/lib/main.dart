import 'package:address_form/district.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Address Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _zipCodeController = TextEditingController();
  String _district = "";
  String _tambon = "";
  final ref = FirebaseDatabase.instance.ref();

  @override
  void dispose() {
    _emailController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Processing Data")));
    final dbRef = ref.child("data/${_emailController.text.hashCode}");
    await dbRef
        .set({
          "email": _emailController.text,
          "zipcode": _zipCodeController.text,
          "district": _district.isEmpty ? "none" : _district,
          "tambon": _tambon.isEmpty ? "none" : _tambon
        })
        .then((_) => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Done"))))
        .catchError((_) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("There is error occured"))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: _emailController,
                  validator: Validator.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      const InputDecoration(labelText: "Enter Email Address")),
              TextFormField(
                  controller: _zipCodeController,
                  validator: Validator.zipCode,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: "Enter Zip Code")),
              const Text("Province: Chiang Mai",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              const Text("District",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Autocomplete(
                  optionsBuilder: (TextEditingValue value) {
                    if (value.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return tambonDistrict.keys.where((element) => element
                        .toLowerCase()
                        .contains(value.text.toLowerCase()));
                  },
                  onSelected: (option) => _district = option),
              const Text("Tambon",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Autocomplete(
                  optionsBuilder: (TextEditingValue value) {
                    if (value.text.isEmpty || _district.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return tambonDistrict[_district]!.where((element) =>
                        element.toLowerCase().contains(value.text));
                  },
                  onSelected: (option) => _tambon = option),
              Center(
                  child: ElevatedButton(
                      onPressed: _onSubmit, child: const Text("Submit")))
            ],
          )),
    );
  }
}

class Validator {
  static String? email(String? value) {
    final pattern = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
    if (value == null || value.isEmpty) {
      return "Please enter your Email.";
    }
    if (!pattern.hasMatch(value)) {
      return "The input is not match the pattern";
    }
    return null;
  }

  static String? zipCode(String? value) {
    final pattern = RegExp(r"^[1-9][0-9]{4}$");
    if (value == null || value.isEmpty) {
      return "Please enter your Zip Code";
    }
    if (!pattern.hasMatch(value)) {
      return "The input is not match the pattern";
    }
    return null;
  }
}
