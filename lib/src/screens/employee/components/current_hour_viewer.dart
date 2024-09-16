import 'package:flutter/material.dart';

class CurrentHourViewer extends StatefulWidget {
  const CurrentHourViewer({super.key});

  @override
  State<CurrentHourViewer> createState() => _CurrentHourViewerState();
}

class _CurrentHourViewerState extends State<CurrentHourViewer> {
  late final Stream _streamTimerSubscription;

  @override
  void initState() {
    _streamTimerSubscription = Stream.periodic(const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StreamBuilder(
      stream: _streamTimerSubscription,
      builder: (context, snapshot) {
        final now = snapshot.data ?? DateTime.now();
        return Text(
          '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}',
          style: theme.textTheme.displayMedium?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
