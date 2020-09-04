import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/repository/data/repo/post_repository.dart';
import 'package:myapp/repository/model/post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostEvent) {
      yield PostLoading();
      try {
        final posts = await postRepository.getPost();
        yield PostLoaded(posts);
      } catch (e) {
        yield PostError(e.toString());
      }
    }
  }
}
