import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';
import '/app/modules/home/model/project_detail.dart';

class ProjectDetailsController extends BaseController {
  final GithubRepository _repository = Get.find(tag: (GithubRepository).toString());

  final Rx<ProjectData> _projectUiData = ProjectData().obs;

  ProjectData get projectUiData => _projectUiData.value;

  @override
  void onInit() {
    var dataModel = Get.arguments;
    if (dataModel is ProjectData) {
      getGithubRepository(dataModel.ownerLoginName, dataModel.repositoryName);
    }
    super.onInit();
  }

  void getGithubRepository(userName, repositoryName) {
    callDataService(
      _repository.getProject(userName, repositoryName),
      onSuccess: _handleProjectDetailsResponseSuccess,
    );
  }

  void _handleProjectDetailsResponseSuccess(Item project) {
    _projectUiData(ProjectData(
      repositoryName: project.name != null ? project.name! : "",
      ownerLoginName: project.owner != null ? project.owner!.login! : "",
      ownerAvatar: project.owner != null ? project.owner!.avatarUrl! : "",
      numberOfStar: project.stargazersCount ?? 0,
      numberOfFork: project.forks ?? 0,
      score: project.score ?? 0.0,
      watchers: project.watchers ?? 0,
      description: project.description ?? "",
    ));
  }
}
