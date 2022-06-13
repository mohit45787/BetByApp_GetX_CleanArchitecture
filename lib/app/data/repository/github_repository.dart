import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';

abstract class GithubRepository {
  ///
  /// this class is for create service
  ///
  /// Define methods here for creating service
  ///

  Future<ProjectSearchResponse> searchProject(SearchQueryParam queryParam);

  Future<Item> getProject(String userName, String repositoryName);
}
