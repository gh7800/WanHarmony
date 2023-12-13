import { TitleBarComponent } from '../view/TitleBarComponent'

@Entry
@Component
struct NotificationsPage {
  @State message: string = 'Hello World'

  build() {
      Column() {
        TitleBarComponent({title:'通知'})
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
  }
}