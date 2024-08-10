import router from '@ohos.router'
import api from '../../http/Api'
import ApiResponse from '../../http/ApiRsponse'
import NotificationModel from '../../model/NotificationModel'
import logUtil from '../../utils/LogUtil'
import toastUtil from '../../utils/ToastUtil'
import LoadingDialog from '../../view/LoadingDialog'
import { TitleBarComponent } from '../../view/TitleBarComponent'
import { TitleContentComponent } from '../../view/TitleContentComponent'

/**
 * 这是：通知详情
 * created by: 2024/6/3
 */
@Entry
@Component
struct NotificationDetailPage {
  @State title: string = ""
  @State uuid: string = ""
  @State notificationModel: NotificationModel = new NotificationModel() //必须初始化new

  loading = new CustomDialogController({
    builder: LoadingDialog(),
    customStyle: true,
    cancel: () => {
      toastUtil.show('已取消')
    }
  })

  aboutToAppear() {
    this.uuid = router.getParams()['uuid']
    this.title = router.getParams()['title']

    this.loading.open()
    api.get("api/notice/message/"+this.uuid).then((result: ApiResponse<NotificationModel>) => {
      if (result.success) {
        this.notificationModel = result.data
        //logUtil.errorJson(this.notificationModel)
      } else {
        toastUtil.show(result.message)
      }
    })
      .catch(error => {
        toastUtil.show(error)
      })
      .finally(() => {
        setTimeout(()=>{
          this.loading.close()
        },1000)
      })
  }

  build() {
    Column() {
      TitleBarComponent({ title: this.title, menuIcon: 'ic_points.png', clickMenu: () => {
        toastUtil.show(this.title)
      } })

      ColumnSplit() {

        TitleContentComponent({ title: '标题：', content: this.notificationModel.title ,mHeight:'40'})
        TitleContentComponent({ title: '内容：', content: this.notificationModel.content })
        TitleContentComponent({ title: '创建时间：', content: this.notificationModel.created_at ,mHeight:'40'})

      }
      .backgroundColor($r('app.color.f2'))

    }
    .width('100%')
    .height('100%')
  }
}



