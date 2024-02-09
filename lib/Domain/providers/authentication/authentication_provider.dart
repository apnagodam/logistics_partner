import 'package:ag_logistics_partner/data/repoImpl/authentication/authentication_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var authenticationProvider = Provider((ref) => AuthenticationRepoImpl());
