import router from '@ohos.router'
import { TitleBarComponent, TitleBarController } from '../view/TitleBarComponent'

@Entry
@Component
struct SettingPage {
  private params = router.getParams()
  private name = this.params?.['name']
  private titleBarController = new TitleBarController()

  build() {
    Column() {
      TitleBarComponent({title: 'Setting',menu:'更多',controller:this.titleBarController})

      Text(this.name)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')

  }

}