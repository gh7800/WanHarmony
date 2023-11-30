import router from '@ohos.router'
import { TitleBarComponent } from '../view/TitleBarComponent'

@Entry
@Component
struct SettingPage {
  private params = router.getParams()
  private name = this.params?.['name']

  build() {

    Column() {
      TitleBarComponent({title: 'Setting',menu:'更多'})

      Text(this.name)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')

  }

  private clickMenu() {

  }
}