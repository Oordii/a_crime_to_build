import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/data/auth.dart';
import 'package:crime_game/features/auth/presentation/widgets/submit_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SignInScreenState();
}

class SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  bool shouldHighlight = false;
  bool obscurePass = true;

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ref
          .read(loginProvider.notifier)
          .login(emailC.text.trim(), passwordC.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              width: 450,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Sign In', style: context.textTheme.titleMedium),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: emailC,
                    validator: _emailValidator,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    decoration: InputDecoration(
                      hintText: 'Email',
                      errorStyle: context.textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordC,
                    validator: _passwordValidator,
                    keyboardType: TextInputType.visiblePassword,
                    autofillHints: const [AutofillHints.password],
                    obscureText: obscurePass,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorStyle: context.textTheme.labelSmall,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePass = !obscurePass;
                            });
                          },
                          icon: Icon(
                            obscurePass
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don`t have an account? ',
                                style: context.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.router.replaceNamed(
                                      Routes.signUp.name,
                                    );
                                  },
                                onEnter: (_) {
                                  setState(() {
                                    shouldHighlight = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    shouldHighlight = false;
                                  });
                                },
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: shouldHighlight ? Colors.white : null,
                                  decoration: TextDecoration.underline,
                                  decorationColor: shouldHighlight
                                      ? Colors.white
                                      : context.textTheme.bodyMedium?.color,
                                  decorationThickness: 6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Consumer(
                    builder: (context, ref, child) {
                      final loginState = ref.watch(loginProvider);
                      final isLoading = loginState is AsyncLoading;
                      final error = loginState is AsyncError
                          ? loginState.error
                          : null;
                      return SubmitButton(
                        onTap: _submit,
                        text: 'Sign In',
                        isLoading: isLoading,
                        error: error?.toString(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
