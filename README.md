

flutter run -d chrome --web-renderer html

flutter run -d chrome --web-renderer canvaskit

编译、起服务
flutter build web --web-renderer html --release
 
```shell
# 部署到 github page 时，需要修改 index.html 里的 <base href="/"> 标签为仓库名，否则会找不到资源路径
# base-href should start and end with /
flutter build web --web-renderer html --release -t lib/main.dart --base-href /YOUER_CDN_PATH/

flutter build web --web-renderer html --release -t lib/main.dart --base-href /flutter_web_demo/

python3 -m http.server 9000
```


flutter run -d macos

## 创建对应平台的代码

flutter create . --platforms=web

