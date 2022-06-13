import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';
import '/app/modules/home/model/project_detail.dart';

class HomeController extends BaseController {
  // find abstrct class  GithubRepository
  final GithubRepository _repository = Get.find(tag: (GithubRepository).toString());

  final RxList<ProjectData> _projectListController = RxList.empty();

  List<ProjectData> get projectList => _projectListController.toList();

  final pagingController = PagingController<ProjectData>();

  void getGithubGetxProjectList() {
    if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;

    // request
    var queryParam = SearchQueryParam(
      searchKeyWord: 'Search Text',
      pageNumber: pagingController.pageNumber,
    );

    /// createService
    var githubRepoSearchService = _repository.searchProject(queryParam);

    //
    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
      // onComplete: (do something),
      // onError: (do something),
      // onStart: (do something),
    );

    pagingController.isLoadingPage = false;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getGithubGetxProjectList();
  }

  onLoadNextPage() {
    logger.i("On load next");

    getGithubGetxProjectList();
  }

  void _handleProjectListResponseSuccess(ProjectSearchResponse response) {
    List<ProjectData>? repoList = response.items
        ?.map((e) => ProjectData(
              repositoryName: e.name != null ? e.name! : "Null",
              ownerLoginName: e.owner != null ? e.owner!.login! : "Null",
              ownerAvatar: e.owner != null ? e.owner!.avatarUrl! : "",
              numberOfStar: e.stargazersCount ?? 0,
              numberOfFork: e.forks ?? 0,
              score: e.score ?? 0.0,
              watchers: e.watchers ?? 0,
              description: e.description ?? "",
            ))
        .toList();

    if (_isLastPage(repoList!.length, response.totalCount!)) {
      pagingController.appendLastPage(repoList);
    } else {
      pagingController.appendPage(repoList);
    }

    var newList = [...pagingController.listItems];

    _projectListController(newList);
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (projectList.length + newListItemCount) >= totalCount;
  }
}
