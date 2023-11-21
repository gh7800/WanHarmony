import { HomePage } from './HomePage'
import { MinePage } from './MinePage'

@Entry
@Component
struct MainPage {
  private tabsController : TabsController = new TabsController();
  @State currentIndex : number = 0

  //自定义tab
  @Builder TabBuilder(title : string,targetIndex : number,selectedImg : Resource,normalImg : Resource){
    Column(){
      Image(this.currentIndex == targetIndex ? selectedImg : normalImg).size({height:22,width:22})
      Text(title)
    }
    .width('100')
    .height(50)
    .onClick(()=>{
      this.currentIndex = targetIndex
      this.tabsController.changeIndex(targetIndex)//切换页面
    })
  }

  build() {
    Column() {

      Tabs({
        barPosition: BarPosition.End,
        controller : this.tabsController
      }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBuilder('首页',0,$r('app.media.icon'),$r('app.media.ic_home')))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBuilder('知识',1,$r('app.media.icon'),$r('app.media.ic_home')))

        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBuilder('导航',2,$r('app.media.icon'),$r('app.media.ic_home')))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBuilder('我的',3,$r('app.media.icon'),$r('app.media.ic_home')))
      }
      .barWidth('100%')
      .barHeight(50)
      .onChange((index) => {
        this.currentIndex = index
      })

    }
    .width('100%')

  }
}