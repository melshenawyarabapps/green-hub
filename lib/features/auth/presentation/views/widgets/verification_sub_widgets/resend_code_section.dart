import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class ResendCodeSection extends HookWidget {
  final VoidCallback? onResend;

  const ResendCodeSection({
    super.key,
    this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    const int secondsInitial = 120;
    final countdown = useState(secondsInitial);
    final timer = useRef<Timer?>(null);
    _startTimer() {
      timer.value = Timer.periodic(const Duration(seconds: 1), (t) {
        if (countdown.value > 0) {
          countdown.value--;
        } else {
          t.cancel();
        }
      });
    }

    useEffect(() {
      _startTimer();
      return () {
        timer.value?.cancel();
      };
    }, []);

    String formatTime(int seconds) {
      final minutes = seconds ~/ 60;
      final secs = seconds % 60;
      return '$minutes:${secs.toString().padLeft(2, '0')}';
    }

    return Column(
      children: [
        32.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.ifCodeNotReceived.tr(),
              style: textTheme.displayLarge,
            ),
            if (countdown.value > 0)
              Opacity(
                opacity: 0.5,
                child: Text(
                  ' ${LocaleKeys.resendCode.tr()}',
                  style: textTheme.displayLarge?.copyWith(
                    color: context.theme.primaryColor,
                  ),
                ),
              )
            else
              AppTextButton.primary(
                title: LocaleKeys.resendCode.tr(),
                onPressed: () {
                  // Reset countdown
                  countdown.value = secondsInitial;
                  // Restart timer
                  _startTimer();
                  onResend?.call();
                },
              ),
          ],
        ),
        8.verticalSpace,
        AnimatedOpacity(
          opacity: countdown.value > 0 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatTime(countdown.value),
                style: textTheme.displayLarge?.copyWith(
                  fontSize: FontSizes.s20,
                  fontWeight: FontWeights.regular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
