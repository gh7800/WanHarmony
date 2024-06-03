import router from '@ohos.router'
import logUtil from '../utils/LogUtil'

// 自定义titleBar组件
@Preview
@Component
export struct TitleBarComponent {
  @Prop title: string
  @State menu ?: string = ''
  @State menuIcon ?: string = '' //传递 menuIcon:'ic_back.png'
  private isNeedBack : boolean = true
  clickBack: () => void //back
  clickMenu: () => void //右侧menu点击事件回调
  bgColor = $r('app.color.main')

  aboutToAppear(){
    logUtil.error(this.menuIcon)
  }

  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .width(30)
        .height(30)
        .visibility(this.isNeedBack ? Visibility.Visible : Visibility.None)
        .onClick(() => {
          if (this.clickBack) {
            this.clickBack()
          } else {
            router.back()
          }
        })

      Text(this.title)
        .fontSize(18)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .layoutWeight(1)

      Text(this.menu)
        .visibility(this.menu ? Visibility.Visible : Visibility.None)
        .fontSize(16)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ right: 20 })
        .onClick(() => {
          if(this.clickMenu){
            this.clickMenu()
          }
        })

      Image($rawfile(this.menuIcon))
        .height(30)
        .width(30)
        .margin({right:16})
        .visibility(this.menuIcon ? Visibility.Visible : Visibility.None)
        .onClick(() => {
          if(this.clickMenu){
            this.clickMenu()
          }
        })

    }
    .width('100%')
    .height(56)
    .backgroundColor(this.bgColor)
  }
}

