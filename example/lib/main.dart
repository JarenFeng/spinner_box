import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spinner_box_example/drop_view.dart';

import 'package:spinner_box_example/pages/custom.dart';
import 'package:spinner_box_example/pages/init.dart';
import 'package:spinner_box_example/pages/fence.dart';
import 'package:spinner_box_example/pages/muti.dart';
import 'package:spinner_box_example/pages/rebuilder.dart';
import 'package:spinner_box_example/pages/theme.dart';

import 'pages/normal.dart';
import 'pages/theme_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _SpinnerTest(),
    );
  }
}

class _SpinnerTest extends StatelessWidget {
  const _SpinnerTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('筛选弹框')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('使用', style: TextStyle(fontSize: 16)),
            _Use(),
            SizedBox(height: 30),
            Text('构建', style: TextStyle(fontSize: 16)),
            _Builder(),
            SizedBox(height: 30),
            Text('自定义主题', style: TextStyle(fontSize: 16)),
            _Theme(),
          ],
        ),
      ),
    );
  }
}

class _Theme extends StatelessWidget {
  const _Theme();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ElevatedButton(
          onPressed: () {
            const ThemePage().push(context);
          },
          child: const _Title('Custom Theme'),
        ),
        ElevatedButton(
          onPressed: () {
            const ThemeHeaderPage().push(context);
          },
          child: const _Title('Custom Header Theme'),
        ),
      ],
    );
  }
}

class _Builder extends StatelessWidget {
  const _Builder();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ElevatedButton(
          onPressed: () {
            const InitPage().push(context);
          },
          child: const _Title('Builder or Children'),
        ),
        ElevatedButton(
          onPressed: () {
            const RebuilderPage().push(context);
          },
          child: const _Title('Rebuilder'),
        ),
      ],
    );
  }
}

class _Use extends StatelessWidget {
  const _Use();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ElevatedButton(
          onPressed: () {
            const SinglePage().push(context);
          },
          child: const _Title('单选条件'),
        ),
        ElevatedButton(
          onPressed: () {
            const MultiPage().push(context);
          },
          child: const _Title('多选条件'),
        ),
        ElevatedButton(
          onPressed: () {
            const CustomPage().push(context);
          },
          child: const _Title('自定义视图'),
        ),
        ElevatedButton(
          onPressed: () {
            const FencePage().push(context);
          },
          child: const _Title('栅栏样式'),
        ),
        ElevatedButton(
          onPressed: () {
            const DropViewPage().push(context);
          },
          child: const _Title('更多'),
        )
      ],
    );
  }
}

extension PagePush on Widget {
  FutureOr push(BuildContext context) {
    return Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => this,
    ));
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 14),
    );
  }
}
