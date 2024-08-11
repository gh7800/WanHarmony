import router from '@ohos.router'
import { TitleBarComponent } from '../../view/TitleBarComponent'

/**
 * page ：请示报告列表页
 * created by: 2024/8/11
 */
@Entry
@Component
struct ReportPage {
    build() {
        Column() {
            TitleBarComponent({ title: '请示报告' })
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
