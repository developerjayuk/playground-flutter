import 'package:flutter/material.dart';
import 'comments_bloc.dart';

export 'comments_bloc.dart';

class CommentsProvider extends InheritedWidget {
  final CommentsBloc bloc;

  CommentsProvider({required super.key, required super.child})
    : bloc = CommentsBloc(),
      super();

  bool updateShouldNotify(_) => true;

  static CommentsBloc of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CommentsProvider>()!;
    return provider.bloc;
  }
}
