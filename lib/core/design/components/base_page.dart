import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';
import 'package:quick_token_new/core/enums/app_status.dart';

class QBasePage extends StatelessWidget {
  const QBasePage({
    super.key,
    this.children,
    this.addTopPadding = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.addSafeSpace = false,
    this.homePage = false,
    this.enableScroll = false,
    this.actions,
    this.label,
    this.labelWidget,
    this.actionBuilder,
    this.customChild,
    this.status = AppStatus.loaded,
    this.allowPopBack = true,
    this.onPopBack,
    this.drawer,
  });

  final List<Widget>? children;
  final bool addTopPadding;
  final bool enableScroll;
  final bool addSafeSpace;
  final String? label;
  final Widget? labelWidget;
  final bool homePage;
  final Widget? customChild;
  final List<PopupMenuEntry<String>> Function(BuildContext)? actionBuilder;
  final List<Widget>? actions;
  final CrossAxisAlignment crossAxisAlignment;
  final AppStatus status;
  final bool allowPopBack;
  final Function()? onPopBack;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final padding = EdgeInsets.only(
      top:
          size.height *
          (addTopPadding
              ? 0.20
              : addSafeSpace
              ? 0.06
              : 0),
      left: 16,
      right: 16,
    );

    Widget content;

    switch (status) {
      case AppStatus.loading:
        content = const Center(child: CircularProgressIndicator());
        break;

      case AppStatus.initial:
        content = Center(
          child: SvgPicture.asset(
            'assets/image/store_solid.svg',
            colorFilter: const ColorFilter.mode(Qcolors.primary, BlendMode.srcIn),
            height: 60,
            width: 60,
          ),
        );
        break;

      default:
        content =
            customChild ??
            (enableScroll
                ? SingleChildScrollView(
                    padding: padding,
                    child: Column(crossAxisAlignment: crossAxisAlignment, children: children ?? []),
                  )
                : Padding(
                    padding: padding,
                    child: Column(crossAxisAlignment: crossAxisAlignment, children: children ?? []),
                  ));
    }

    if (homePage) return content;

    return PopScope(
      canPop: allowPopBack,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) await onPopBack?.call();
      },
      child: Scaffold(
        drawer: drawer,
        resizeToAvoidBottomInset: false,
        appBar: (label != null || labelWidget != null)
            ? AppBar(
                centerTitle: true,
                automaticallyImplyLeading: drawer != null, // ✅ SHOW MENU
                title: labelWidget ?? Text(label!, style: QStyles.h3),
                actions: actionBuilder == null
                    ? actions
                    : [
                        PopupMenuButton(
                          itemBuilder: actionBuilder!,
                          color: Qcolors.backgroundLight,
                          offset: const Offset(0, 40),
                        ),
                      ],
              )
            : null,
        body: content,
      ),
    );
  }
}
