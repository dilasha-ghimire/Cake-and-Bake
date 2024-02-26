import 'package:cake_app/screens/home/blocs/save_cake_bloc/save_cake_bloc.dart';
import 'package:cake_repository/cake_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCakeScreen extends StatelessWidget {
  const AddCakeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Cake'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CakeForm(),
      ),
    );
  }
}

class CakeForm extends StatefulWidget {
  @override
  _CakeFormState createState() => _CakeFormState();
}

class _CakeFormState extends State<CakeForm> {
  final _formKey = GlobalKey<FormState>();
  late CakeEntity _cake;
  bool _isVeg = true;
  int _egglessLevel = 0;
  int _calories = 0;
  int _sugar = 0;
  int _fat = 0;
  int _carbs = 0;

  @override
  void initState() {
    super.initState();
    _cake = CakeEntity(
      cakeId: '',
      picture: '',
      isVeg: true,
      eggless: 0,
      name: '',
      description: '',
      price: 0,
      discount: 0,
      macros: Macros(
        calories: 0,
        sugar: 0,
        fat: 0,
        carbs: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Cake ID'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the cake ID';
              }
              return null;
            },
            onSaved: (value) => _cake.cakeId = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the cake name';
              }
              return null;
            },
            onSaved: (value) => _cake.name = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the cake description';
              }
              return null;
            },
            onSaved: (value) => _cake.description = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Picture URL'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the picture URL';
              }
              return null;
            },
            onSaved: (value) => _cake.picture = value!,
          ),
          CheckboxListTile(
            title: Text('Is Veg?'),
            value: _isVeg,
            onChanged: (value) {
              setState(() {
                _isVeg = value!;
              });
            },
          ),
          DropdownButtonFormField<int>(
            decoration: InputDecoration(labelText: 'Eggless'),
            value: _egglessLevel,
            items: const [
              DropdownMenuItem<int>(
                value: 0,
                child: Text('Eggless'),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text('Egg'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _egglessLevel = value!;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the price';
              }
              return null;
            },
            onSaved: (value) => _cake.price = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Discount'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the discount';
              }
              return null;
            },
            onSaved: (value) => _cake.discount = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Calories'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the calories';
              }
              return null;
            },
            onSaved: (value) => _calories = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Sugar'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the sugar';
              }
              return null;
            },
            onSaved: (value) => _sugar = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Fat'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the fat';
              }
              return null;
            },
            onSaved: (value) => _fat = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Carbs'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the carbs';
              }
              return null;
            },
            onSaved: (value) => _carbs = int.parse(value!),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _saveCake(context);
              }
            },
            child: const Text('Save or update Cake'),
          ),
        ],
      ),
    );
  }

  void _saveCake(BuildContext context) {
    BlocProvider.of<SaveCakeBloc>(context).add(SaveCake(_cake as Cake));
    Navigator.pop(context);
  }
}
