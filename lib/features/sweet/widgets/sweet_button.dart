import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/models/sweet.dart';
import '../bloc/sweet_bloc.dart';

class SweetButton extends StatelessWidget {
  const SweetButton(
    this.sweet, {
    super.key,
  });

  final Sweet sweet;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SweetBloc, SweetState>(
      builder: (context, state) {
        return Opacity(
          opacity: sweet.done ? 0 : 1,
          child: CupertinoButton(
            onPressed: state is StartedSweetState
                ? () {
                    if (!sweet.visible) {
                      context
                          .read<SweetBloc>()
                          .add(SelectSweetEvent(sweet: sweet));
                    }
                  }
                : null,
            padding: EdgeInsets.zero,
            child: Container(
              height: 56,
              width: 56,
              margin: const EdgeInsets.all(2),
              child: Stack(
                children: [
                  if (sweet.visible) ...[
                    SvgPicture.asset('assets/sweet/border3.svg'),
                    Center(
                      child: Image.asset(
                        sweet.asset,
                        height: 47,
                      ),
                    ),
                  ] else ...[
                    SvgPicture.asset('assets/sweet/hide1.svg'),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
