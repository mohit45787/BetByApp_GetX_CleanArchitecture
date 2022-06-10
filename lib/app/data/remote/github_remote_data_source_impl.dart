import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/remote/github_remote_data_source.dart';
import '/app/network/dio_provider.dart';

class RemoteDataSourceImpl extends BaseRemoteSource implements RemoteDataSource {
  @override
  Future<ProjectSearchResponse> searchProject(SearchQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/search/repositories";
    var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());

    try {
      return callApiWithErrorParser(dioCall).then((response) => _parseGithubProjectSearchResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Item> getProjectDetails(String userName, String repositoryName) {
    var endpoint = "${DioProvider.baseUrl}/repos/$userName/$repositoryName";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((response) => _parseGithubProjectResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  ProjectSearchResponse _parseGithubProjectSearchResponse(Response<dynamic> response) {
    return ProjectSearchResponse.fromJson(response.data);
  }

  Item _parseGithubProjectResponse(Response<dynamic> response) {
    return Item.fromJson(response.data);
  }
}
