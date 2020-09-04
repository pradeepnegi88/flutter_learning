import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/repository/bloc/post_bloc.dart';
import 'package:myapp/repository/data/repo/post_repository.dart';

class BlocPatternWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: BlocProvider(
          create: (context) =>
              PostBloc(PostRepositoryImpl())..add(FetchPosts()),
          child: BlocHome(),
        ));
  }
}

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bloc Pattern"),
        ),
        body: Center(child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return CircularProgressIndicator();
            } else if (state is PostLoaded) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(state.posts[index].title),
                        subtitle: Text(state.posts[index].body),
                      ),
                    );
                  },
                  itemCount: state.posts.length);
            }
            return CircularProgressIndicator();
          },
        )));
  }
}
