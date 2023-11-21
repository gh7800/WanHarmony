@Entry
@Component
export struct MinePage {
  @State message: string = '我的'

  build() {
    Row() {
      Column() {

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
    }
    .height('100%')
  }
}