import router from '@ohos.router'
import hilog from '@ohos.hilog'
import preferenceUtil from '../utils/PreferencesUtil'
import constantUtil from '../utils/ConstantUtil'
import toastUtil from '../utils/ToastUtil'
import logUtil from '../utils/LogUtil'

@Entry
@Component
struct Index {

  aboutToAppear(){
    preferenceUtil.getPreferences(getContext())
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

        Button('开始体验', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(20)
          .margin({ top: 30 })
          .width(150)
          .onClick(() => {
            var url = 'pages/LoginPage'
            preferenceUtil.getString(constantUtil.TOKEN)
              .then((data) => {
                if (data) {
                  url = 'pages/MainPage'
                }
                this.startPage(url)
              })
              .catch((err) => {
                toastUtil.show(err)
                this.startPage(url)
              })

          })
      }
      .width('100%')
      .padding(22)
      //.backgroundColor(Color.Pink)

    }
    .height('100%')
    .alignItems(VerticalAlign.Bottom)
    .padding({ bottom: 100 })
  }

  startPage(url: string) {
    logUtil.error(url.replace('/','-'))
    router.replaceUrl({ url }, router.RouterMode.Single, (err) => { //关闭当前页并打开新的页面
      console.error(err.message)
    })
  }
}