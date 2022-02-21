import 'package:bloc_provider_list/my_home_page/bloc/list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../settings_page/settings_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Provider List App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          ),
        ],
      ),
      body: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
        if (state is ListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ListLoadedState) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.todos[index].title!),
              );
            },
          );
        } else if (state is ListErrorState) {
          return const Center(
            child: Text('Error'),
          );
        } else if (state is ListClearedState) {
          return const Center(
            child: Text('List Cleared'),
          );
        } else {
          return const Center(
            child: Text('Welcome, press the FAB to start'),
          );
        }
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'download',
            onPressed: () {
              context.read<ListBloc>().add(FetchTodosEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.download),
          ),
          const SizedBox(
            height: 4,
          ),
          FloatingActionButton(
            heroTag: 'clear',
            onPressed: () {
              context.read<ListBloc>().add(ClearTodosEvent());
            },
            tooltip: 'Clear',
            child: const Icon(Icons.clear_all),
          ),
        ],
      ),
    );
  }
}
