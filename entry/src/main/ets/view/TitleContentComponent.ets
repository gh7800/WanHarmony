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
        .padding({ left: 10 })
        .fontSize(16)
        .fontColor($r('app.color.c6'))
      // .backgroundColor($r('app.color.black'))
        .layoutWeight(9)

      Image($r('app.media.ic_enter'))
        .width(32)
        .height(32)
        .layoutWeight(1)
        .margin({ left: 10, right: 10 })
        .visibility(this.needIcon ? Visibility.Visible : Visibility.None)
    }
    .width(this.mWidth)
    .height(this.mHeight)
    .backgroundColor($r('app.color.write'))
    .padding({top:1,bottom:1})
  }

  /*RelativeContainer() {
    Text(this.title)
      .fontColor($r('app.color.c3'))
      .backgroundColor($r('app.color.write'))
      .padding({left:16,right:16})
      .id('title')
      .alignRules({
        top:{anchor:'__container__',align:VerticalAlign.Top},
        left:{anchor:'__container__',align:HorizontalAlign.Start},
        bottom:{anchor:'__container__',align:VerticalAlign.Bottom},
        // right:{anchor:'content',align:HorizontalAlign.Start}
      })

    Text(this.content)
      .padding({right:16,left:16})
      .fontColor($r('app.color.c6'))
      // .backgroundColor($r('app.color.black'))
      .id('content')
      .alignRules({
        top:{anchor:'__container__',align:VerticalAlign.Top},
        bottom:{anchor:'__container__',align:VerticalAlign.Bottom},
        right: { anchor: 'image', align: HorizontalAlign.Start },
        left: { anchor: 'title', align: HorizontalAlign.End },
      })

    Image($r('app.media.ic_enter'))
      .width(32)
      .height(32)
      .margin({left:10,right:10})
      .visibility(this.needIcon ? Visibility.Visible : Visibility.None)
      .alignRules({
        right:{anchor:'__container__',align:HorizontalAlign.End},
        center:{anchor:'__container__',align:VerticalAlign.Center}
      })
      .id('image')
  }
  .width(this.mWidth)
  .height(this.mHeight)
  .backgroundColor($r('app.color.write'))
}*/
}