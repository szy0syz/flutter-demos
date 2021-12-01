# flutter_fooderlich

> **Section II: Everything’s a Widget**

## Notes

- The Scaffold widget implements all your basic visual layout structure needs.
- Scaffold 实现了你对基本视觉布局结构的所有需求！
- 嵌套的 widgets 就像很长的 staircase 一样
- 我们应该主动拆分 “嵌套地狱”，例如我们从 Scaffold 开始拆分
- 拆分出来的 home.dart 是一个 `StatefullWidget`，而顶层 widget 应该还是保持 `StatelessWidget`

```dart
class _HomeState extends State<Home> {
  // TODO: Add state variables and functions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          // 2
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // TODO: Show selected tab
      body: Center(
        child: Text('Let\'s get cooking ! ',
            // 3
            style: Theme.of(context).textTheme.headline1),
      ),
      // TODO: Add bottom navigation bar
    );
  }
}
```

上面代码很奇葩，`theme` 从哪里来？

> Theme.of(context) returns the nearest Theme in the widget tree. If the widget has a defined Theme, it returns that. Otherwise, it returns the app’s theme.

- This function handles tapped tab bar items. Here, you set the index of the item
that the user pressed. setState() notifies the framework that the state of this object has changed, then rebuilds this widget internally.

- Apply a padding of 16 on all sides of the box. Flutter units are specified in logical
pixels, which are like dp on Android.
  - 在Flutter页面布局时用的单位是 `逻辑像素`，相当于安卓系统中的 `dp` 单位
- Apply BoxDecoration. This describes how to draw a box. 🐬
- In BoxDecoration, set up DecorationImage, which tells the box to paint an
image.
- 如果用了Stack后，不做定位，你的所有组件都会从 `(0,0)` 坐标开始重叠绘制
