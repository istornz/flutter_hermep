<p align="center">
  <img src="https://i.ibb.co/tL3G0Lf/hermep.png" />
</p>

An MVVM state management library which let full access to widget state.

## 🧐 What is it ?

Hermep provide a way to create an MVVM page structure and let you full access to the widget state.

To summarize It's just a very simple wrapper to split your code logic 😎

## 👻 Getting started

- Create a model file ```<your_class>_viewmodel.dart```

```dart
class YourClassModel with HermepModel {
  late int counter;
}
```

- Create the presenter file ```<your_class>_presenter.dart```

```dart
class YourClassPresenter with HermepPresenter<YourClassModel, YourClassView> {
  YourClassPresenter(
    YourClassView viewInterface,
  ) {
    this.viewModel = YourClassModel();
    this.viewInterface = viewInterface;
  }

  @override
  void dispose() { }

  @override
  void init() { }
}
```

- Create the page file ```<your_class>.dart```

```dart
abstract class YourClassView {}

class YourClassPage extends StatefulWidget {
  YourClassPage({Key? key});

  @override
  _YourClassPageState createState() => _YourClassPageState();
}

class _YourClassPageState extends HermepPage<YourClassModel, YourClassPresenter> with YourClassView {
  @override
  void createAnimations() { }

  @override
  HermepPresenter createPresenter() => YourClassPresenter(this);

  @override
  Widget build(BuildContext context) {
    return Text('Your Page');
  }
}
```

## 💫 Animations

Yes you can use animations with Hermep and it's very easy !

- In your model.dart file, create the animation & value notifier (used to trigger animation)

```dart
class YourClassModel with HermepModel {
  late ValueNotifier<bool> triggerAnimation;
  late Animation<double> animation;

  YourClassModel();
}
```

- In your presenter.dart file, init the animation value notifier

```dart
// [...]
@override
void init() {
  this.viewModel.triggerAnimation = new ValueNotifier(false);
}
// [...]
```

- In your page, override the ```createAnimations()``` method to init the animation controller & assign animation tween

```dart
// [...]
@override
void createAnimations() {
  this.animationControllers = {
    this.viewModel.triggerAnimation: AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
  };

  this.viewModel.animation = Tween<double>(
    begin: 50,
    end: 300,
  ).animate(this.animationControllers.values.first)
    ..addListener(() => this.refreshView());
}
// [..]
```

- To trigger ```on``` or ```off``` your animation, just set the value notifier in your presenter 🎉

```dart
// launch the animation
this.viewModel.triggerAnimation.value = true;

// stop the animation
this.viewModel.triggerAnimation.value = false;
```