import 'package:api_users_filter/controller/user_controller.dart';
import 'package:api_users_filter/model/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 20,
              ),
            ),
          ),
        ],
        title: const Text(
          'Contatos',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 10,
              bottom: 7,
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outlined),
                labelText: 'Pesquisar um usuário',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _userController.getUser(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snap.hasError) {
                  return const Center(
                    child: Text('Erro ao carregar os dados da API'),
                  );
                } else {
                  final users = snap.data as List<UserModel>;

                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          right: 4,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(
                              users[index].username,
                              style: const TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
