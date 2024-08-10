import router from '@ohos.router'
import preferenceUtil from '../utils/PreferencesUtil'
import constantUtil from '../utils/ConstantUtil'
import toastUtil from '../utils/ToastUtil'
import { GlobalContext } from '../utils/GlobalContext'

/**
 * 闪屏页 -- 最先显示
 * 输入page快速创建页面
 */
@Entry
@Component
struct Index {
  aboutToAppear() {
    preferenceUtil.getPreferences(getContext())

    setTimeout(()=>{
      var url = 'pages/LoginPage'

      preferenceUtil.getString(constantUtil.TOKEN)
        .then((data) => {
          if (data) {
            GlobalContext.getContext().setValue(constantUtil.TOKEN,data)
            url = 'pages/MainPage'
          }
        })
        .catch((err) => {
          toastUtil.show(err)
        })
        .finally(() => {
          this.startPage(url)
        })

    },1500)
  }

  build() {
    Row() {
      Column(
        {
          space: 10, //组件之间的间距
        }
      ) {
        Image($r('app.media.icon'))
          .width(100)
          .height(100)

        Text("鸿蒙OS")
          .fontSize(22)
          .margin({ top: 10 })
          .fontWeight(FontWeight.Bold)

        Button('移动办公', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(20)
          .margin({ top: 30 })
          .width(150)
          .onClick(() => {

          })
      }
      .width('100%')
      .padding(22)

    }
    .height('100%')
    .alignItems(VerticalAlign.Bottom)
    .padding({ bottom: 100 })
  }

  startPage(url: string) {
    router.replaceUrl({ url }, router.RouterMode.Single, (err) => { //关闭当前页并打开新的页面
      console.error(err.message)
    })
  }
}