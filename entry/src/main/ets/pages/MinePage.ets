import { PullToRefresh } from '@ohos/pulltorefresh'
import router from '@ohos.router'
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl'
import common from '@ohos.app.ability.common'
import logUtil from '../utils/LogUtil'
import preferenceUtil from '../utils/PreferencesUtil'
import constantUtil from '../utils/ConstantUtil'
import { CommonTitleContent } from '../view/CommonTitleContent'
import toastUtil from '../utils/ToastUtil'
import { MediaHelper } from '../manager/MediaHelper'
// import {} from '@ohos/dialogs'

// @Entry
@Component
export struct MinePage {
  @State isRefreshing: boolean = false
  private scroller: Scroller = new Scroller();
  @State data: string[] = ['账号', '名称', '设置']
  private permissions: Array<Permissions> = ['ohos.permission.CAMERA','ohos.permission.READ_MEDIA']
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

  onPageShow(){
    logUtil.error("_____mine_____")
  }

  build() {
    Column() {
      PullToRefresh({
        data: $data,
        scroller: this.scroller,
        customList: () => {
          this.getView()
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
  private getView() {
    // 刷新组件 需绑定列表或宫格组件
    List({ scroller: this.scroller })

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
          this.initPermissions(this.permissions)
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


    CommonTitleContent({ title: '账号', content: this.userName })
    CommonTitleContent({ title: '名称', content: this.realName })
    CommonTitleContent({ title: '设置', content: '', onclick() {
      router.pushUrl({ url: 'pages/SettingPage' })
    } })


  }

  //请求应用权限
  initPermissions(permissions: Array<Permissions>) {
    let context = getContext(this) as common.UIAbilityContext
    let atManager = abilityAccessCtrl.createAtManager()
    atManager.requestPermissionsFromUser(context, permissions)
      .then((data) => {
        let grantStatus: Array<number> = data.authResults;
        let grantName: Array<string> = data.permissions;
        let length: number = grantStatus.length;
        var isAgree = true
        for (let i = 0; i < length; i++) {
          if (grantStatus[i] === 0) {
            // 用户授权，可以继续访问目标操作
            logUtil.error('已同意')
          } else {
            toastUtil.show('已禁止-' + grantName[i])
            // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
            isAgree = false
          }
        }

        if(isAgree) {
          this.takePhoto()
        }

      })
      .catch((err) => {
        logUtil.error(err)
      })
  }

  showPopupDialog(){

  }

  takePhoto() {
    let mediaHelper = new MediaHelper(getContext())
    mediaHelper.takePhoto(getContext() as common.UIAbilityContext).then(mediaBean => {
      logUtil.error('____'+mediaBean)
    }).catch(error =>{
      logUtil.error('error____'+error)
    })
  }
}