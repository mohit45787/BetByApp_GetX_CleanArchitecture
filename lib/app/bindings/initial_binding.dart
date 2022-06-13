import 'package:BetByApp/app/bindings/repository_bindings.dart';
import 'package:get/get.dart';

import 'local_source_bindings.dart';
import 'remote_source_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies(); // GithubRepository
    RemoteSourceBindings().dependencies(); // remote GithubRemoteDataSource
    LocalSourceBindings().dependencies(); // local PreferenceManager
  }
}
