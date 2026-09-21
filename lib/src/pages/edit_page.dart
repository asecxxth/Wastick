import 'dart:async';
import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stickers/generated/intl/app_localizations.dart';
import 'package:stickers/src/constants.dart';
import 'package:stickers/src/data/sticker_pack.dart';
import 'package:stickers/src/pages/default_page.dart';
import 'package:stickers/src/pages/edit_layer.dart';
import 'package:stickers/src/pages/paint_page.dart';
import 'package:stickers/src/pages/preview_page.dart';
import 'package:stickers/src/video/common.dart';
import 'package:video_player/video_player.dart';

class EditPage extends StatefulWidget {
  final StickerPack pack;
  final int index;
  final String mediaPath;
  final MediaType mediaType;

  const EditPage({
    required this.pack,
    required this.index,
    required this.mediaPath,
    required this.mediaType,
    super.key,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  // ... file ini tidak perlu ditulis semua kalau fokus hanya issue year2023 ...
  // cukup ganti bagian di bawah ini
  // ...
  // di dalam bagian _message != null:
  if (_message != null)
    Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Theme.of(context).colorScheme.surface.withAlpha(200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.exporting,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 64,
              width: 64,
              child: CircularProgressIndicator(
                value: _exportProgress,
              ),
            ),
            Text(
              _message ?? "",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    )
  // ...
}
