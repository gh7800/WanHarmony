import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import preferenceUtil from '../utils/PreferencesUtil'
import { TitleBarComponent } from '../view/TitleBarComponent'
import toastUtil from '../utils/ToastUtil'

@Entry
@Component
struct SettingPage {
  private params = router.getParams()
  private name = this.params?.['name']
  @State title: string = '设置'

  build() {
    Column() {
      TitleBarComponent({ title: this.title, menu: '···', clickMenu: () => {
        this.title = "setting"
        console.error("123")
      } })

      Column() {

      }
      .layoutWeight(1)

      Text('退出应用程序')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .border({ radius: 40 })
        .backgroundColor($r('app.color.black'))
        .width('90%')
        .height(40)
        .textAlign(TextAlign.Center)
        .padding({ top: 10, bottom: 10 })
        .fontColor($r('app.color.ff'))
        .margin({ bottom: 10 })
        .onClick(() => {
          promptAction.showDialog({
            title: '提示',
            message: '您确定退出当前账号?',
            buttons: [
              { text: '取消', color: '#ffd44848' },
              { text: '确定', color: '#000000' }
            ]
          })
            .then(data => {
              if (data.index == 0) {
                toastUtil.show('取消')
              } else {
                preferenceUtil.clear()
                router.clear()
                router.replaceUrl({ url: 'pages/LoginPage' })
              }
            })
        })

    }
    .width('100%')
    .height('100%')

  }
}