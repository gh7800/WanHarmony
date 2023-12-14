import { PullToRefresh } from '@ohos/pulltorefresh'
import router from '@ohos.router'
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl'
import common from '@ohos.app.ability.common'
import logUtil from '../utils/LogUtil'
import preferenceUtil from '../utils/PreferencesUtil'
import constantUtil from '../utils/ConstantUtil'
import { CommonTitleContent } from '../view/CommonTitleContent'


@Entry
@Component
export struct MinePage {
  @State message: string = '我的'
  private list = ['账号', '名称', '设置']
  @State isRefreshing: boolean = false
  private scroller: Scroller = new Scroller();
  @State data: string[] = this.list
  private permissions: Array<Permissions> = ['ohos.permission.CAMERA', 'ohos.permission.WRITE_MEDIA']
  @State realName: string = ''
  @State lastName: string = ''
  @State userName: string = ''

  aboutToAppear() {
    preferenceUtil.getString(constantUtil.REAL_NAME).then((data) => {
      this.realName = data.toString()
      this.lastName = this.realName.substring(0, 1)
    })

    preferenceUtil.getString(constantUtil.USERNAME).then((data) => {
      this.userName = data.toString()
    })
  }

  build() {
    Column() {
      PullToRefresh({
        data: $data,
        scroller: this.scroller,
        customList: () => {
          this.getListView()
        },
        onRefresh: () => {
          return new Promise<string>((resolve, reject) => {
            setTimeout(() => {
              resolve("刷新成功")

            }, 2000)
          })
        },
        customLoad: null,
        customRefresh: null
      })

    }
    .backgroundColor($r('app.color.f2'))
    .width('100%')
    .height('100%')

  }

  @Builder
  private commonLayout(title: string, content: string = null) {
    Row() {
      Image($r('app.media.ic_home'))
        .width(22)
        .height(22)
        .margin({ left: 10 })
      Text(title)
        .layoutWeight(1)
        .margin({ left: 10 })
        .fontSize(16)
      Text(content)
        .width(66)
        .textAlign(TextAlign.End)
        .fontSize(16)
      Image($r('app.media.ic_enter'))
        .width(40)
        .height(40)
    }
    .backgroundColor($r('app.color.ff'))
    .borderRadius(8)
    .margin({ left: 10, top: 5, right: 10 })
    .padding({ top: 5, bottom: 5 })
  }

  //头部
  @Builder
  private getListView() {
      Row() {
        Button(this.lastName)
          .fontSize(50)
          .borderRadius('5')
          .width(78)
          .height(78)
          .type(ButtonType.Normal)
          .backgroundColor($r('app.color.main'))
          .fontColor($r('app.color.ff'))
          .margin({ left: 5, top: 5 })
          .onClick((() => {
            this.isRefreshing = !this.isRefreshing
          }))

        Column() {
          Text(this.realName)
            .fontSize(18)
            .fontColor($r('app.color.c3'))
            .margin({ top: 10 })

          Text('职位')
            .fontSize(16)
            .fontColor($r('app.color.c6'))
            .margin({ bottom: 5 })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(HorizontalAlign.Start)
        .height(88)
        .padding({ left: 10 })
      }
      .width('96%')
      .backgroundColor($r('app.color.ff'))
      .margin({ top: 15, bottom: 10 })
      .borderRadius(8)
      .padding({ top: 5, bottom: 10 })

      CommonTitleContent({title:'账号',content:this.userName}).margin({left:10,right:10})
      CommonTitleContent({title:'名称',content:this.realName}).margin({left:10,right:10})
      CommonTitleContent({title:'设置',content:''}).margin({left:10,right:10})

    /*
        List({ space: 15, scroller: this.scroller }) {
          ForEach(this.list, (item: string, index: number) => {
            ListItem() {
              Row() {
                Image($r('app.media.ic_home'))
                  .width(22)
                  .height(22)
                  .margin({ left: 10 })
                Text(item)
                  .layoutWeight(1)
                  .margin({ left: 10 })
                  .fontSize(16)
                Text(this.realName)
                  .margin({ left: 10 })
                  .fontSize(16)
                Image($r('app.media.ic_enter'))
                  .width(40)
                  .height(40)
                  .margin({ right: 10 })
              }
              .backgroundColor($r('app.color.f2'))
              .borderRadius(8)
              .padding({ top: 5, bottom: 5 })
            }.onClick(() => {
              var it = this.data[index]
              switch (it) {
                case "设置":
                  router.pushUrl({url:'pages/SettingPage',params:{
                    name:'设置'
                  }})
                  break
                case '积分':
                  break
                default:
                  break
              }
            })
          })
        }
        .width('90%')
        .alignListItem(ListItemAlign.Center)
        .edgeEffect(EdgeEffect.None) //必须设置列表滑动到边缘无效果
    */

  }

  //请求应用权限
  initPermissions(permissions: Array<Permissions>) {
    let context = getContext(this) as common.UIAbilityContext
    let atManager = abilityAccessCtrl.createAtManager()
    atManager.requestPermissionsFromUser(context, permissions)
      .then((data) => {
        let grantStatus: Array<number> = data.authResults;
        let length: number = grantStatus.length;
        for (let i = 0; i < length; i++) {
          if (grantStatus[i] === 0) {
            // 用户授权，可以继续访问目标操作
          } else {
            // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
            return;
          }
        }
      })
      .catch((err) => {
        logUtil.error(err)
      })
  }
}