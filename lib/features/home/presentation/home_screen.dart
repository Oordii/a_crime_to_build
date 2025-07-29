import 'package:carousel_slider/carousel_slider.dart';
import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/auth/data/auth/auth.dart';
import 'package:crime_game/features/home/data/profile.dart';
import 'package:crime_game/features/home/domain/models/profile/profile.dart';
import 'package:crime_game/features/home/presentation/widgets/campaign_card.dart';
import 'package:crime_game/features/home/presentation/widgets/join_dialog.dart';
import 'package:crime_game/features/home/presentation/widgets/profile_create_dialog.dart';
import 'package:crime_game/features/home/presentation/widgets/room_card.dart';
import 'package:crime_game/features/room/data/active_rooms/active_rooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SignInScreenState();
}

class SignInScreenState extends ConsumerState<HomeScreen> {
  _profileListener(
    AsyncValue<ProfileModel>? prev,
    AsyncValue<ProfileModel> next,
  ) {
    if (next is AsyncError && next.error.toString() == 'profile_not_created') {
      showDialog(context: context, builder: (context) => ProfileCreateDialog());
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<ProfileModel> profileState = ref.watch(profileProvider);
    ref.listen(profileProvider, _profileListener);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: context.textTheme.displayLarge),
        actions: [
          profileState.map(
            data: (data) => Text('Hello, ${data.value.username}'),
            error: (error) => error.error.toString() == 'profile_not_created'
                ? SizedBox.shrink()
                : Text(
                    error.error.toString(),
                    style: context.textTheme.labelSmall,
                  ),
            loading: (l) => CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              child: Text('Logout', style: context.textTheme.bodyMedium),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 48,
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Icon(Icons.info_outlined, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This game is under development. Some issues may be present',
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 24),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(Icons.info_outlined, size: 16),
                          const SizedBox(width: 8),
                          Text('Info', style: context.textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Card(
                    child: SizedBox(
                      height: 700,
                      child: CarouselSlider(
                        options: CarouselOptions(enableInfiniteScroll: false),
                        items: [
                          1,
                          2,
                          3,
                          4,
                          5,
                        ].map((i) => CampaignCard()).toList(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(Icons.info_outlined, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            'Active Rooms',
                            style: context.textTheme.bodyMedium,
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              final rooms = ref.watch(activeRoomsProvider);

                              return Column(
                                children: [
                                  SizedBox(
                                    height: 400,
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        children: [
                                          if (rooms.isLoading) ...[
                                            CircularProgressIndicator(),
                                          ] else if (rooms.hasError) ...[
                                            Text(
                                              rooms.error!.toString(),
                                              style:
                                                  context.textTheme.labelSmall,
                                            ),
                                          ] else if (rooms.hasValue) ...[
                                            for (final r in rooms.value!) ...[
                                              RoomCard(room: r),
                                              const SizedBox(height: 8),
                                            ],
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  JoinDialog(),
                                            );
                                          },
                                          child: Text(
                                            'Join by code',
                                            style: context.textTheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
