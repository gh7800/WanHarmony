import router from '@ohos.router'
import { TitleBarComponent } from '../view/TitleBarComponent'

@Entry
@Component
struct SettingPage {
  private params = router.getParams()
  private name = this.params?.['name']
  @State title : string = '设置'

  build() {
    Column() {
      TitleBarComponent({ title: this.title, menu: '···', clickMenu: () => {
        this.title = "setting"
        console.error("123")
      } })

      Text(this.name)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')

  }
}