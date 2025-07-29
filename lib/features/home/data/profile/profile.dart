import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/auth/data/auth/auth.dart';
import 'package:crime_game/features/auth/domain/app_user/app_user.dart';
import 'package:crime_game/features/home/domain/models/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile.g.dart';

@Riverpod(keepAlive: true)
class Profile extends _$Profile {
  @override
  FutureOr<ProfileModel> build() async {
    final auth = ref.watch(authProvider);

    if (auth.isEmpty) {
      throw 'Not authenticated';
    }
    final userId = auth.uid;
    final res = await supabase.from('user_profile').select().eq('id', userId);

    if (res.isEmpty) {
      throw 'profile_not_created';
    }

    return ProfileModel.fromJson(res.first);
  }

  FutureOr<void> setUsername(String username) async {
    state = AsyncLoading();
    final auth = ref.read(authProvider);

    if (auth.isEmpty) {
      throw 'Not authenticated';
    }

    final res = await supabase
        .from('user_profile')
        .upsert({'id': auth.uid, 'username': username})
        .select('*')
        .single();

    if (res.isEmpty) {
      throw 'Failed to update profile';
    }

    state = AsyncData(ProfileModel.fromJson(res));
  }
}
