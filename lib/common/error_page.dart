/*
 * Trireme for Deluge - A Deluge thin client for Android.
 * Copyright (C) 2018  Aashrava Holla
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';

import 'common.dart';

class ErrorPage extends StatelessWidget {
  static const _tag = "ErrorPage";
  final Object error;

  ErrorPage(this.error);

  @override
  Widget build(BuildContext context) {
    if (error is Error) {
      Log.e(_tag, error.toString());
      Log.e(_tag, (error as Error).stackTrace.toString());
    } else {
      Log.e(_tag, error.toString());
    }
    try {
      var errorString = prettifyError(error);
      return Center(
        child: Text(errorString),
      );
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}