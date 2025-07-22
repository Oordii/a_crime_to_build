import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/data/auth.dart';
import 'package:crime_game/features/auth/presentation/widgets/submit_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final passwordCC = TextEditingController();
  bool shouldHighlight = false;
  bool obscurePass = true;
  bool obscurePassC = true;

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    passwordCC.dispose();
    super.dispose();
  }

  _signUpListener(AsyncValue<String?>? prev, AsyncValue<String?> next) {
    if (next.hasValue && !next.hasError && (next.value?.isNotEmpty ?? false)) {
      context.router.replaceNamed(Routes.emailSent.name);
    }
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

  String? _passwordCValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password confirmation is required';
    } else if (value != passwordC.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ref
          .read(signUpProvider.notifier)
          .signUp(email: emailC.text.trim(), password: passwordC.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(signUpProvider, _signUpListener);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 450,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Registration', style: context.textTheme.titleMedium),
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
                  TextFormField(
                    controller: passwordCC,
                    validator: _passwordCValidator,
                    keyboardType: TextInputType.visiblePassword,
                    autofillHints: const [AutofillHints.password],
                    obscureText: obscurePassC,
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      errorStyle: context.textTheme.labelSmall,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassC = !obscurePassC;
                            });
                          },
                          icon: Icon(
                            obscurePassC
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
                                text: 'Already have an account? ',
                                style: context.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: 'Sign In',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.router.replaceNamed(
                                      Routes.signIn.name,
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
                      final signUpState = ref.watch(signUpProvider);
                      final isLoading = signUpState is AsyncLoading;
                      final error = signUpState is AsyncError
                          ? signUpState.error
                          : null;
                      return SubmitButton(
                        onTap: _submit,
                        text: 'Sign Up',
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
