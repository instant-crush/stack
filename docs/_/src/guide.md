# Guide

## 文档格式

### 块

所有块及其意义

::: info
内容
:::
::: tip
内容
:::
::: warning
内容
:::
::: danger
内容
:::
::: details
内容
:::

### 链接

[这个内部链接，在这个网站内跳转](#文档格式)

[这是外部链接，跳出这个网站](https://github.com/instant-crush/stack)

### 代码

只要是代码块，都可以点击复制，只复制代码，样式只为了服务文档

高亮和聚焦都是为了突出重点，聚焦代码块在hover时会取消聚焦

diffs突出与前一次代码的不同

警告和报错突出对应代码是有问题的

#### 高亮一行或多行

这里高亮了第2行

```dart{2}
void main() {
  print("Hello World!");
}
```

这里高亮了第1、3行

```dart{1,3}
int num(int a, int b) => a + b;
void main() {
  print(num(1, 1));
}
```

#### 聚焦一行或多行

这里聚焦了第2行

```dart
void main() {
  print("Hello World!"); // [!code focus]
}
```

这里聚焦了第1、3行

```dart
int num(int a, int b) => a + b; // [!code focus]
void main() {
  print(num(1, 1)); // [!code focus]
}
```

#### 差异

与上次提交的代码相比，增加了第1、4行，删除了第3行

```dart
int num(int a, int b) => a + b; // [!code ++]
void main() {
  print("Hello World!"); // [!code --]
  print(num(1, 1)); // [!code ++]
}
```

#### 警告和报错

num函数的声明和执行都不会报错，但标识符名称是关键字，所以警告第1、4行

报错第3行，因为print没有`;`结尾

```dart
int num(int a, int b) => a + b; // [!code warning]
void main() {
  print("Hello World!") // [!code error]
  print(num(1, 1)); // [!code warning]
}
```

#### 组

一组相关的代码
::: code-group

```dart [util.dart]
int num(int a, int b) => a + b;
```

```dart [main.dart]
import './util.dart'; // [!code focus]

void main() {
  print("Hello World!");
  print(num(1, 1)); // [!code focus]
}
```

:::

## 文档说明

开发流程大概是初始化项目，然后引入需要的库以方便开发，所以关于编程语言在此文档的导航层级是：

- 语言
  - 语言总结0
  - 语言总结1
  - 语言总结2
  - ...
  - 语言总结N
  - libs
    - lib0
    - lib1
    - lib2
    - ...
    - libN

例如这里开始学习lib2，那么需要完成一个项目以具备以下内容：

- lib2的所有功能
- 搜索一个尽可能多的用到lib2功能的例子从头实现，可以自创一个需求，但因为时间紧迫，可能大多数例子都是照抄需求

::: tip 特别说明
对于一个应用来说，只用上述所说的lib2来单独完成是不可能的，在开发过程中应该会用到多个lib，所以在lib2的文档页面中会链接这个应用用到的所有lib的文档链接
:::

能用图的绝不写字，要不是截屏，要不就是[mermaid](https://mermaid.js.org)生成的图

已中文为主，但专业词汇不会翻译，因为技术文档基本都是英文的
