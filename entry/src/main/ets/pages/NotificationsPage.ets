import toastUtil from '../utils/ToastUtil'
import { TitleBarComponent } from '../view/TitleBarComponent'

@Entry
@Component
struct NotificationsPage {

  build() {
    Column() {
      TitleBarComponent({ title: '通知' ,menu : '更多'})
    }
    .width('100%')
    .justifyContent(FlexAlign.Start)
  }
}