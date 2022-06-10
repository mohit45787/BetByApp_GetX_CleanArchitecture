import 'package:get/get.dart';

import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/remote/github_remote_data_source.dart';
import '/app/data/repository/github_repository.dart';

class GithubRepositoryImpl implements GithubRepository {
  final RemoteDataSource _remoteSource = Get.find(tag: (RemoteDataSource).toString());

  @override
  Future<ProjectSearchResponse> searchProject(SearchQueryParam queryParam) {
    return _remoteSource.searchProject(queryParam);
  }

  @override
  Future<Item> getProject(String userName, String repositoryName) {
    return _remoteSource.getProjectDetails(userName, repositoryName);
  }
}
