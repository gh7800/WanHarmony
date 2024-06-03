## 鸿蒙OS APP

#### 1、项目 WanHarmony
#### 2、ts → ArkTs 方舟ts 开发语言
#### 3、ArkUI 方舟ui UI框架
#### 4、复制一份 build-profile.json5 
#### 5、所有的page页都要在 resources-base-profile-main_pages.json添加
#### 6、[TS基础语法链接](https://www.runoob.com/typescript/ts-basic-syntax.html)
#### 7、[鸿蒙语法链接](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/arkts-get-started-0000001504769321-V2)

```c
/**
 * 声明变量 
 */
var global_num = 12          // 全局变量
class Numbers { 
   num_val = 13;             // 实例变量
   static sval = 10;         // 静态变量
   
   storeNum():void { 
      var local_num = 14;    // 局部变量
   } 
} 
```

---

![ArkTs](/image/s2.png)
![ArkTs](/image/s4.png)
![ArkTs](/image/s1.png)
#### UIAbility的生命周期，UIAbility的生命周期包括Create、Foreground、Background、Destroy四个状态，WindowStageCreate和WindowStageDestroy为窗口管理器（WindowStage）在UIAbility中管理UI界面功能的两个生命周期回调，从而实现UIAbility与窗口之间的弱耦合
![ArkTs](/image/s3.png)
