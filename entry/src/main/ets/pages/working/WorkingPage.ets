/**
 * page ：工作
 * created by: 2024/8/14
 */
import router from '@ohos.router'

@Component
export struct WorkingPage {
    build() {
        Column() {
            //TitleBarComponent({ title: '标题' })
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
