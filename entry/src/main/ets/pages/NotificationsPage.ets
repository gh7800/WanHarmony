import api from '../http/Api'
import ApiResponse from '../http/ApiRsponse'
import NotificationModel from '../model/NotificationModel'
import logUtil from '../utils/LogUtil'
import toastUtil from '../utils/ToastUtil'
import { TitleBarComponent } from '../view/TitleBarComponent'

@Entry
@Component
struct NotificationsPage {

  aboutToAppear(){
    api.get('api/notice/message')
      .then((result : ApiResponse<Array<NotificationModel>>) => {
        logUtil.error(result.message)
      })
      .catch(error =>{
        toastUtil.show(error)
      })
  }

  build() {
    Column() {
      TitleBarComponent({ title: '通知' ,menu : '更多'})

    }
    .width('100%')
    .justifyContent(FlexAlign.Start)
  }
}