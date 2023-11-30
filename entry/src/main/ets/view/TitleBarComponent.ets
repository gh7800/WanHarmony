import router from '@ohos.router'

@Preview
@Component
export struct TitleBarComponent {
  @State title: string = ''
  @State menu ?: string = ''
  controller: TitleBarController = null

  aboutToAppear() {
    if (this.controller) {
      this.controller.setItem(this) //绑定controller
    }
  }

  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .width(30)
        .height(30)
        .onClick(() => {
          router.back()
        })

      Text(this.title)
        .fontSize(16)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Text(this.menu)
        .fontSize(16)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ right: 20 })
        .onClick(() => {
          this.controller.clickMenu()
        })

    }
    .width('100%')
    .height(56)
    .alignItems(VerticalAlign.Center)
    .backgroundColor($r('app.color.main'))
  }
}

export class TitleBarController {
  titleBarComponent: TitleBarComponent = null

  setItem(titleBarComponent: TitleBarComponent) {
    this.titleBarComponent = titleBarComponent
  }

  changeTitle(title: string) {
    this.titleBarComponent.title = title
  }

  changeMenu(menu: string) {
    this.titleBarComponent.menu = menu
  }

  clickMenu() {

  }
}
