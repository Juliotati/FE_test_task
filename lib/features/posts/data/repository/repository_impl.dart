import 'package:fe_test_task/core/core.dart';
import 'package:fe_test_task/core/errors/exeception.dart';
import 'package:fe_test_task/features/posts/data/datasources/local_datasource.dart';
import 'package:fe_test_task/features/posts/data/datasources/remote_datasource.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:fe_test_task/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fe_test_task/features/posts/domain/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  const PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final PostRemoteDataSource remoteDataSource;
  final PostsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final List<PostModel>? remotePosts = await remoteDataSource.getPosts();
        localDataSource.cachePosts(remotePosts!);
        return Right<Failure, List<PostModel>>(remotePosts);
      } on ServerException {
        return Left<Failure, List<PostModel>>(ServerFailure());
      }
    }
    try {
      final List<PostModel>? localPosts = await localDataSource.getPosts();
      return Right<Failure, List<PostModel>>(localPosts!);
    } on CacheException {
      return Left<Failure, List<PostModel>>(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> cachePost(PostModel post) async {
    try {
      await localDataSource.cachePosts(<PostModel>[post]);
      return const Right<Failure, void>(null);
    } on CacheException {
      return Left<Failure, List<PostModel>>(CacheFailure());
    }
  }
}
