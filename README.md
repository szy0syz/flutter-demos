# flutter-demos

> Some demos to learn dart & flutter.

## Menus

- 📝　flutter_two_you
- ✅　flutter_sqlite_todos
- 📝　flutter_ctrip
- ✅　flutter_dicee
- ✅　flutter_mi_card
- ✅　flutter_xylophone 🎹
- ✅　flutter_quizzler
- ✅　flutter_bmi_calculator
- ✅　flutter_phone_verification
- ✅　flutter_blm_onboarding
- 🌀　flutter_clima
- 🌀　flutter_flash_chat
- 🌀　flutter_firebase_instagram
- 🌀　flutter_bloc_crypto_app
- 🌀　flutter_firebase_realtime_chat
- 🌀　flutter_focused-pop-up_menu

![00](preview/dice.gif)
![01](preview/xylophone.gif)
![02](preview/quizzler.gif)
![03](preview/mi_card.gif)
![04](preview/todo_list.gif)
![05](preview/bmi.gif)
![06](preview/verify.gif)
![06](preview/blm_onboarding.gif)

### Notes

- `Flutter` 中怎么更新 `ListView` ？
  - 在 Android 中，View 是屏幕上显示的所有内容的基础，按钮、工具栏、输入框等一些均为 View；
  - 在 iOS 中，构建 UI 的过程中将大量使用 view 对象。这些对象都是 UIVIew 的实例。它们可以用作容器来承载其他的 UIVIew，最终构成你的界面布局；
  - 在 React Native 中， View 是一个支持 Flexbox 布局的容器，样式、触摸处理和辅助控制。
  - 在 Flutter 中，我们可以将 Widget 当作是 Android、iOS、RN中的 View，但并不完全等价，其实 Flutter 认为 Widget 是声明和构建 UI 的方法。
  - 但 Widget 与 View 有区别。
    - 首先，Widget 具有不同的声明周期：他们是不可变的，他们会存在于状态被改变之前。每当 Widget 或其他状态发生改变时，Flutter 框架都会创建一个新的 Widget 实例树。相比之下，Android和iOS 视图被绘制一次，并且在调用 `invalidate/setNeedsDisplay` 之前不会重绘。
    - 此外，与 View 不同，Flutter 的 Widget 很轻巧，部分原因在于它的不可变性。因为它本身不是视图，并且不会直接绘制任何东西，而是对 UI 及其语义的描述而已。
- 不要在赤裸裸的使用 Image 组件，鬼知道它又多大，大多了就出现故障栏，要用 `Expanded` 包一下
- `Expanded` 里可以使用 `flex:2` 属性，设置它在当前行占据的比例，和 CSS-flex 里的属性类似
  - 如果都设 `flex:1` 就是一样大
  - 怪求不得，看了下继承关系：[`Object > DiagnosticableTree > Widget > ProxyWidget > ParentDataWidget<FlexParentData > Flexible >  Expanded`](https://api.flutter.dev/flutter/widgets/Expanded-class.html)
- 有些时候组件自带一些属性则可以省略自己写，如 `FlatButton` 自带 `padding` 属性，我们则不需要再写
  - 怎么看这个组件原生带了额外属性，调试工具里搜关键字吧

![flex1](preview/flex1.jpg)

- 代码片段快捷前缀：`stl` - `Flutter stateless widget` or `Flutter stateful widget`
- vscode-flutter 套壳快捷键：`cmd + .`，好用到耐不住嘛
- 如果不想让格式化器换行代码，就加一个 `,` 在末尾
- 容器宽度或高度占满全屏怎么办 -> `width: double.infinity`
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
- dart 的三元操作符

```dart
/// 重构前
Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  /// 1 = male, 2 = female
  void updateColour(Gender selectedGender) {
  /// male card pressed
  if (selectedGender == Gender.male) {
    if (maleCardColour == inactiveCardColour) {
      maleCardColour = activeCardColour;
      femaleCardColour = inactiveCardColour;
    } else {
      maleCardColour = inactiveCardColour;
    }
  }

  if (selectedGender == Gender.female) {
    if (femaleCardColour == inactiveCardColour) {
      femaleCardColour = activeCardColour;
      maleCardColour = inactiveCardColour;
    } else {
      femaleCardColour = inactiveCardColour;
    }
  }
}

/// ----------------

/// 重构后
Expanded(
  child: GestureDetector(
    onTap: () {
      setState(() {
        selectedGender = Gender.female;
      });
    },
    child: ReusableCard(
      colour: selectedGender == Gender.female
          ? activeCardColour
          : inactiveCardColour,
      cardChild: IconContent(
        icon: FontAwesomeIcons.venus,
        label: 'FEMALE',
      ),
    ),
  ),
),
```

- `Controller` 级别的组件需要销毁时 `dispose()`

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

- **鉴于 `dart` 的特殊声明式写法，记得把可重用的声明变量统一存放在 `contants.dart` 目录，统一管理了！**
  - 吐槽: `dart` 的声明竟然不需要 `export` 导出，随便搞！
- Flutter 中的 flex 布局之 baseline
  - 不加 `textBaseline` 属性就报错了

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.baseline,
  textBaseline: TextBaseline.alphabetic,
  children: <Widget>[
    Text('180', style: numberTextStyle),
    Text('cm', style: labelTextStyle),
  ],
)
```

- `flutter` 中如何改一个标准组件呢？“套壳”
  - 例如 Slider 组件要修改拖拽的圆点：`SliderTheme`
- `flutter` 中觉得 `FloatingActionButton` 不满意，自己搞一个呗
  - 发现它只是对 `RawMaterialButton` 包了一层(重写)，那我也就这样搞
  - 发现有些属性搞不定，去源码里翻翻，把需要的属性直接抄过来即可
- 来个封装的组件

```dart
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
```

- Class

![class](preview/class.jpg)

- `Dart` 中 `const` 和 `final` 的区别
  - 需要确认的值
  - 不可变性的传递
  - 内存中的重复创建

```dart
/// 需要确认的值
final dt = DateTime.now();  // ✅
const dt = DateTime.now();  // ❌

/// 不可变性的传递
final List ls1 = [11,22,33];
const List ls2 = [11,22,33];
ls1[1] = 44;  // ✅
ls2[1] = 44;  // ❌

/// 内存中的重复创建
final List fls1 = [11,22,33];
final List fls2 = [11,22,33];
print(identical(fls1, fls2));  // false

const List cls1 = [11,22,33];
const List cls2 = [11,22,33];
print(identical(fls1, fls2));  // true
```

- Dart中的默认值：一切都是 `Object`，变量声明默认都是 `null`
- Flutter 组件中 `SafeArea` 到底是啥 ?

![s2](preview/safeArea1.png)
![s1](preview/safeArea0.png)

- Flutter 获取GPS坐标插件：`geolocator`
- Flutter 中 Stateless 组件声明周期:
  - 1. `Widget build()`
- Flutter 中 Stateful 组件声明周期:
  - 1. `void initState()`
  - 2. `Widget build()`
  - 3. `void deactive()`
- 所以说从组件声明周期函数就能引出如果只在页面初次渲染时获取地理位置，则在 `initState()` 函数中调用即可
