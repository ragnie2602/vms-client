import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/monitor_screen.dart';
import '../../core/base_view.dart';
import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const LoadHomeData());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: MonitorScreen());
  }
}

class HomeView extends BaseView<HomeBloc> {
  const HomeView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VMS Flutter Client'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.isLoading)
                  const CircularProgressIndicator()
                else
                  Text(
                    state.message,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    bloc(context).add(const LoadHomeData());
                  },
                  child: const Text('Reload Data'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
