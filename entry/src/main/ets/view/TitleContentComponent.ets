@Preview
@Component
export struct TitleContentComponent {
  @Prop title: string
  @Prop content: string
  @State mWidth: string = '100%'
  @State mHeight: string = 'auto' //高度自适应
  @State needIcon: boolean = false

  build() {
    Row() {
      Text(this.title)
        .fontSize(16)
        .fontColor($r('app.color.c3'))
        .backgroundColor($r('app.color.write'))
        .padding({ left: 10 })
        .layoutWeight(4)

      Text(this.content)
        .height('auto')
        .padding({ left: 10,right:10 })
        .fontSize(16)
        .fontColor($r('app.color.c6'))
      // .backgroundColor($r('app.color.black'))
        .layoutWeight(9)
        .textAlign(TextAlign.End)

      Image($r('app.media.ic_enter'))
        .width(32)
        .height(32)
        .layoutWeight(1)
        .margin({ right: 10 })
        .visibility(this.needIcon ? Visibility.Visible : Visibility.None)
    }
    .width(this.mWidth)
    .height(this.mHeight)
    .backgroundColor($r('app.color.write'))
    .padding({top:1,bottom:1})
  }

}