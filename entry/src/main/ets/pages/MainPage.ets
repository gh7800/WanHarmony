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
        .tabBar(this.TabBuilder('首页',0,$r('app.media.ic_home_selected'),$r('app.media.ic_home_normal')))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBuilder('我的',3,$r('app.media.ic_mine_selected'),$r('app.media.ic_mine_normal')))
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