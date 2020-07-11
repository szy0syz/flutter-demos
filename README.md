# flutter-demos

## Menus

- flutter_two_you
- flutter_sqlite_todos
- flutter_ctrip
- flutter_bmi_calculator
- flutter_clima
- flutter_flash_chat

![01](preview/todo_list.gif)

## Notes

- 代码片段快捷前缀：`stl` - `Flutter stateless widget` or `Flutter stateful widget`
- vscode-flutter 套壳快捷键：`cmd + .`，好用到耐不住嘛
- 如果不想让格式化器换行代码，就加一个 `,` 在末尾
- 容器宽度或高度占满全屏怎么办 -> `width: double.infinity`
- `Flutter` 中怎么更新 `ListView` ？
- 关于类的构造函数的参数问题

```dart
/// 此时 colour 是可选参数，且不能以 _ 开头
class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour});

  /// 此时就为必填参数了
  /// ReusableCard({@Required this.colour});
}
```

- Instance Variable = Field = Property
- 布局技巧
  - 最外层 `Column` 行组件
  - 每行先来一个 `Row` 列组件
  - 最后每行的里，再包一个 `Expanded` 撑开组件，因为中间那个沾满整行，如果两个就50%排布

![layout1](preview/layout1.png)

- 这里不是 `js` 了，该用枚举就用枚举吧

```dart
/// 原来是这样初始化 state
@override
void initState() {
  super.initState();
  _dateController.text = _dateFormatter.format(_date);
}

/// 这也就是生命周期函数
/// 需要把 controller 销毁
@override
dispose() {
  _dateController.dispose();
  super.dispose();
}

/// 和 js 一样，函数式编程
items: _priorities.map((String priority) {
  return DropdownMenuItem(
    value: priority,
    child: Text(
      priority,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    ),
  );
}).toList(),
```

- 人生第一个 `flutter-model`

```dart
class Task {
  int id;
  String title;
  DateTime date;
  String priority;
  int status; // 0: Incomplete, 1:Complete

  Task({this.title, this.date, this.priority, this.status});
  Task.withId({this.id, this.title, this.date, this.priority, this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['title'] = title;
    map['date'] = date.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;

    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      priority: map['priority'],
      status: map['status'],
    );
  }
}
```
