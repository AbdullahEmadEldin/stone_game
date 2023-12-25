import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stone_game/logic/database_cubit/cubit/history_db_cubit.dart';
import 'package:stone_game/view/widgets/gamerecord_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HistoryDbCubit>(context).getGameRecords();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games History'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<HistoryDbCubit>(context).deleteGameHistory();
                BlocProvider.of<HistoryDbCubit>(context).getGameRecords();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<HistoryDbCubit, HistoryDbState>(
          builder: (context, state) {
            if (state is LoadingHistory) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                      child: CircularProgressIndicator.adaptive()));
            }
            if (state is SuccessfulGameRecords) {
              final records = state.gameRecords;
              if (records.isEmpty) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: Text('No Game Records')));
              }
              return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: records.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: GamerecordTile(
                        gameRecord: records[index],
                      ),
                    );
                  });
            } else {
              return SizedBox(
                child: Text('Some state:: ${state.toString()}'),
              );
            }
          },
        ),
      ),
    );
  }
}
