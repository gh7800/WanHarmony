import { TitleBarComponent } from '../view/TitleBarComponent'

@Entry
@Component
export struct HomePage {
  @State message: string = '首页'

  @Styles dateName(){ //共有通用属性
    .margin({left:10, right: 10 })
    .height(45)
  }

  build() {
    Column() {
      TitleBarComponent({ title: this.message, isNeedBack: false })

      Row() {
        Text('2023/12/09 星期六')
          .dateName()
          .fontColor($r('app.color.f2'))

        Text('您好 XXX')
          .dateName()
          .fontColor($r('app.color.f2'))

      }
      .width('100%')
      .backgroundColor($r('app.color.main'))
      .justifyContent(FlexAlign.SpaceBetween)


    }
    .width('100%')
    .height('100%')
  }
}