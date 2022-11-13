import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/gohobi.dart';
import '../domain/task.dart';

class MyTaskNameViewModel extends StateNotifier<List<Task>> {
  MyTaskNameViewModel()
      : super([
          Task(
            uid: "1",
            taskName: "私のお風呂掃除",
            deadline: DateTime.now(),
            smallTaskName: ["お風呂の中を掃除する", "お風呂の外を掃除する"],
            gohobiListId: [
              // Gohobi(uid: "0", message: "よくやったね", fromUserName: "田中"),
              // Gohobi(uid: "1", message: "お疲れ様", fromUserName: "鈴木"),
              // Gohobi(uid: "2", message: "お疲れ様", fromUserName: "鈴木"),
              // Gohobi(uid: "3", message: "お疲れ様", fromUserName: "鈴木"),
              // Gohobi(uid: "4", message: "お疲れ様", fromUserName: "鈴木"),
              // Gohobi(uid: "5", message: "お疲れ様", fromUserName: "鈴木"),
              // Gohobi(uid: "6", message: "お疲れ様です", fromUserName: "佐藤")
            ],
          ),
          Task(
            uid: "2",
            taskName: "私の洗濯",
            deadline: DateTime(2023, 10, 10),
            smallTaskName: ["洗濯機に入れる", "洗濯機を回す", "洗濯物を干す"],
            gohobiListId: [
              // Gohobi(uid: "7", message: "すばらしい", fromUserName: "清水"),
              // Gohobi(uid: "8", message: "お疲れ様です", fromUserName: "山田")
            ],
          ),
          Task(
            uid: "3",
            taskName: "私の掃除",
            deadline: DateTime(2023, 10, 9),
            smallTaskName: ["キッチンを掃除する", "トイレを掃除する", "お風呂を掃除する"],
            gohobiListId: [],
          ),
        ]);

  void add(value) {
    state.add(value);
  }
}
