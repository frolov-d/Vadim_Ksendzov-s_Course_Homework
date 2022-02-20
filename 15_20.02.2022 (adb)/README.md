# ADB HW_1

1. Отобразить подключённый девайс в консоли: `adb devices`
```shell
Success
```
2. Вывести адрес приложения todolist в системе Android: `adb shell cmd package list packages | findstr "com.android.todolist"` или `adb shell 'pm list packages -f' | findstr "com.android.todolist"`
```shell
package:com.android.todolist
```
3. Установить .apk файл приложениия todolist на телефон с компьютера через  ADB: `adb install D:\Dwnldd\todolist.apk`
```shell
Performing Streamed Install
Success
```
4. Сделать скриншот запущенного приложения todolist и сразу скопировать на компьютер в одной команде: `adb shell screencap -p /sdcard/Download/screen01.png && adb pull /sdcard/Download/screen01.png D:\Dwnldd`
```shell
/sdcard/Download/screen02.png: 1 file pulled, 0 skipped. 3.9 MB/s (14037 bytes in 0.003s)
```
![screenshot](https://raw.githubusercontent.com/frolov-d/Vadim_Ksendzov-s_Course_Homework/main/15_20.02.2022%20(adb)/screen01.png)
5. Вывести в консоль логи приложения todolist: `adb logcat | findstr "com.android.todolist"`
```shell
...
02-20 11:28:52.620  1267  1293 I StatusBarDisable: setFlags what=0 which=1 pkg=Window{f2c4670 u0 com.android.todolist/com.android.todolist.MainActivity}
02-20 11:28:52.675  1267  1374 V WindowManager: Removing Window{d6bbcb3 u0 SnapshotStartingWindow for taskId=678} from AppWindowToken{fe67e2d token=Token{cbfbd44 ActivityRecord{4febe57 u0 com.android.todolist/.MainActivity t678}}}
02-20 11:28:52.677  1267  1293 I StatusBarDisable: setFlags what=0 which=1 pkg=Window{f2c4670 u0 com.android.todolist/com.android.todolist.MainActivity}
02-20 11:28:52.694  1267  1293 I StatusBarDisable: setFlags what=0 which=1 pkg=Window{f2c4670 u0 com.android.todolist/com.android.todolist.MainActivity}
02-20 11:28:58.213  1792  2877 D ThermalTrace: saveRepeatData, app:com.android.todolist, shell:32,abient:-100
02-20 11:29:24.057  1267  1293 I StatusBarDisable: setFlags what=0 which=1 pkg=Window{a655dc8 u0 com.android.todolist/com.android.todolist.MainActivity}
02-20 11:29:24.058  1267  3889 V WindowManager: addWindow: Window{a655dc8 u0 com.android.todolist/com.android.todolist.MainActivity}
...
```
6. Скопировать логи приложения todolist на компьютер: `adb logcat | findstr "com.android.todolist" > D:\Dwnldd\todolist.log`
[Ссылка](./todolist.log) на логи
7. Удалить приложение todolist с телефона через ADB: `adb uninstall "com.android.todolist"`
```shell
Success
```