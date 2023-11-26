import data from '@ohos.telephony.data'
import RefreshAnimHeader from '../view/RefreshAnimHeader'

@Entry
@Component
export struct MinePage {
  @State message: string = '我的'
  private data = [1, 2, 3, 4, 5]
  @State isRefreshing: boolean = false

  build() {
    Row() {
      Column() {
        Refresh({ refreshing: $$this.isRefreshing }){
            // RefreshAnimHeader()
        }
        .width('100%')
        .onRefreshing(() => {
        })
        .onStateChange((status) => {
          console.error(status.toString())
        })
        .backgroundColor(Color.Gray)
        // .visibility(this.isRefreshing ? Visibility.Visible : Visibility.None)

        Row() {
          Button('鸿')
            .fontSize(50)
            .borderRadius('5')
            .width(78)
            .height(78)
            .type(ButtonType.Normal)
            .backgroundColor($r('app.color.black'))
            .margin({ left: 10, top: 5 })
            .onClick((() => {
              this.isRefreshing = !this.isRefreshing
            }))

          Column() {
            Text('名称')
              .fontSize(18)
              .fontColor($r('app.color.c3'))
              .margin({ top: 10 })

            Text('职位---')
              .fontSize(16)
              .fontColor($r('app.color.c6'))
              .margin({ bottom: 5 })
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(HorizontalAlign.Start)
          .height(88)
          .padding({ left: 10 })
        }
        .width('90%')
        .backgroundColor($r('app.color.f2'))
        .margin({ top: 10, bottom: 10 })
        .borderRadius(8)
        .padding({ top: 5, bottom: 10 })

        List() {
          ForEach(this.data, (index, num) => {
            ListItem() {
              Row() {
                Image($r('app.media.ic_home'))
                  .width(22)
                  .height(22)
                  .margin({ left: 10 })
                Text('账号：')
                  .layoutWeight(1)
                  .margin({ left: 10 })
                  .fontSize(16)
                Image($r('app.media.ic_enter'))
                  .width(40)
                  .height(40)
                  .margin({ right: 10 })
              }
              .backgroundColor($r('app.color.f2'))
              .margin({ top: 5 })
              .borderRadius(8)
              .padding({ top: 5, bottom: 5 })
            }
          })
        }
        .width('90%')
        .alignListItem(ListItemAlign.Center)

      }
      .width('100%')
      .height('100%')

    }
    .height('100%')
  }
}