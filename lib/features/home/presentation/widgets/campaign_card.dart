import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';

const String example =
    "In the shadows of a rain-slicked city, corruption whispers through alleyways and power hides behind polished smiles. As a hard-boiled detective with a checkered past, you’re pulled into a case that starts with a missing person—and ends with a conspiracy that could shatter what's left of justice. Trust no one. Follow the lies. Solve the crime... or become part of it.";

class CampaignCard extends StatelessWidget {
  const CampaignCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 800,
      margin: EdgeInsets.symmetric(vertical: 12),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.white12, blurRadius: 10, spreadRadius: 8),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'https://media.istockphoto.com/id/2138789286/de/vektor/mafia-spion-mann-logo-smoking-anzug-ikone-vektor-stock-illustration.jpg?s=612x612&w=0&k=20&c=c2f5bCO6PRnwWciou8nw-MEeKjAUWy8JmH5PCahqZHM=',
                height: 450,
                width: 800,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            'Shadow killer',
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            example,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 16,
            child: SubmitButton(
              text: 'Start',
              onTap: () {
                context.router.pushNamed(
                  Routes.room.name,
                  pathParameters: {'room_code': 'test'},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
