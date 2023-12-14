@Preview
@Component
export struct CommonTitleContent {
  @State title: string = 'title'
  @Prop content: string
  iconTitle: string
  iconRight: string
  onclick : ()=>void

  build() {
    Row() {
      Image($r('app.media.ic_home'))
        .width(22)
        .height(22)
        .margin({ left: 10 })
      Text(this.title)
        .layoutWeight(1)
        .margin({ left: 10 })
        .fontSize(16)
      Text(this.content)
        .width(66)
        .textAlign(TextAlign.End)
        .fontSize(16)
      Image($r('app.media.ic_enter'))
        .width(40)
        .height(40)
    }
    .width('100%')
    .backgroundColor($r('app.color.ff'))
    .borderRadius(8)
    .margin({ left: 10, top: 5, right: 10 })
    .padding({ top: 5, bottom: 5 })
    .onClick(()=>{
      if(this.onclick){
        this.onclick()
      }
    })
  }

}