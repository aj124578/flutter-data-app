import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// final byeProvider = Provider<String>((ref) {
//   return "Bye";
// }); // Provider 객체를 통해 창고에 접근할 수 있음
//
// final helloWorldProvider = Provider<String>((ref) {
//   final String value = ref.read(byeProvider);
//   return "Hello world : "+ value;
// });

final helloWorldProvider = Provider<String>((ref) {
  return "Hello world";
});

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope( // 상위 위젯을 ProviderScope로 감싸주어야 함
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {// WidgetRef ref : provider를 참조하는 래퍼런스 / 적어주어야 provider에 접근 가능
    final String value = ref.read(helloWorldProvider); // helloWorldProvider provider가 들고있는 데이터를 달라고 함
    // final String value2 = ref.read(byeProvider); // helloWorldProvider provider가 들고있는 데이터를 달라고 함

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text(value + " : "),
        ),
      ),
    );
  }
}