part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  List<Post> posts;
  PostLoaded(this.posts);
}

// ignore: must_be_immutable
class PostError extends PostState {
  String message;
  PostError(this.message);
}
