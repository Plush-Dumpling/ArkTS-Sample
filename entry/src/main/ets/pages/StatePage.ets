import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import ComponentsName from '../constants/ComponentsName';
import RouterPath from '../constants/RouterPath';
import { ComponentModel } from '../mode/ComponentModel';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/19
 * Email: tao351992257@163.com
 */
@ComponentV2
export struct StatePage {
  @Local components: ComponentModel[] = []

  aboutToAppear(): void {
    console.info('ArkUiPage -> aboutToAppear')
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: ComponentsName.STATE_COMPUTED, pageUrl: RouterPath.STATE_COMPUTED })
  }

  @Builder
  customComponentsItem(model: ComponentModel) {
    Text(`${model.componentName}`)
      .width('100%')
      .textAlign(TextAlign.Center)
      .fontSize(16)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.black'))
  }

  build() {
    Stack() {
      List() {
        ForEach(this.components, (item: ComponentModel) => {
          ListItem({ style: ListItemStyle.NONE }) {
            this.customComponentsItem(item)
          }.height(45).onClick(() => {
            HMRouterMgr.push({ pageUrl: item.pageUrl })
          })
        })

        // 底部占位：OutTabsComponent的悬浮TabBar(barOverlap=true)盖住列表内容底部56vp，
        // 滚到底时占位项落在TabBar后面，保证最后一个真实列表项完整可见
        ListItem({ style: ListItemStyle.NONE }) {
          Column()
        }
        .width('100%')
        .height(56)
        .hitTestBehavior(HitTestMode.None)
      }
      .width('100%')
      .height('100%')
      .divider({ strokeWidth: 0.5, color: $r('app.color.blue2') })
    }
    .width('100%')
    .height('100%')
  }
}