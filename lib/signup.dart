import 'package:flutter/material.dart';
import 'package:authentification/data.dart';
import 'package:authentification/login.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Center(
        child: SignupForm(),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Ajout de l'image
            Image.asset('Images/signup_image.png'),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nom'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre email';
                }
                // Ajoutez ici une validation d'email si nécessaire
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mot de passe';
                }
                // Ajoutez ici une validation de mot de passe si nécessaire
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Enregistrer l'utilisateur et renvoyer à la page de connexion
                  _registerUser();
                }
              },
              child: const Text('S\'inscrire'),
            ),
          ],
        ),
      ),
    );
  }

  void _registerUser() {
    // Vérifier si l'utilisateur existe déjà avec cet email
    // Pour simplifier, nous supposons qu'il n'existe pas et que nous enregistrons simplement l'utilisateur ici
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Enregistrement simulé dans une base de données ou une liste
    // Vous devriez utiliser une base de données réelle pour stocker les informations des utilisateurs
    // Ici, nous utilisons une liste de Map pour simuler une base de données
    Map<String, String> newUser = {
      'name': name,
      'email': email,
      'password': password,
    };

    // Ajouter l'utilisateur à la liste des utilisateurs
    // Vous devriez utiliser un mécanisme d'authentification plus sécurisé et une base de données sécurisée
    users.add(newUser);

    // Afficher un message de succès
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Inscription réussie avec succès !'),
      ),
    );

    // Attendre un moment avant de naviguer vers la page de connexion
    Future.delayed(Duration(seconds: 2), () {
      // Aller à la page de connexion
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }
}
