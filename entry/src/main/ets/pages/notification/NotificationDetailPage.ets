import router from '@ohos.router'
import logUtil from '../../utils/LogUtil'
import toastUtil from '../../utils/ToastUtil'
import { TitleBarComponent } from '../../view/TitleBarComponent'

/**
 * 这是：通知详情
 * created by: 2024/6/3
 */
@Entry
@Component
struct NotificationDetailPage {
    @State title : string = ""
    @State uuid : string = ""

    aboutToAppear(){
        this.uuid = router.getParams()['uuid']
        this.title = router.getParams()['title']

        logUtil.error(this.uuid + this.title)
    }

    build() {
        Column() {
            TitleBarComponent({ title: this.title ,menuIcon:'app.media.ic_back',clickMenu : ()=>{
                toastUtil.show(this.title)
            }})

            Column() {
                Text('页面')
                    .fontSize(24)
                    .margin({ top: 20 })
                Button('Go Back')
                    .margin({ top: 20 })
                    .onClick(() => {
                        router.back()
                    })
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
        }
    }
}



