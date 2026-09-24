import { HMRouter } from "@hadss/hmrouter";
import RouterPath from "../constants/RouterPath";
import { HdsListItemCard } from "@kit.UIDesignKit";
import { PreferencesUtil } from "../datasoure/ArkData";

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/23
 * Email: lijt@eetrust.com
 */
@ObservedV2
export class ArkDataModel {
  @Trace modelName: string = ''
}


@HMRouter({ pageUrl: RouterPath.ARK_DATA_PATH })
@ComponentV2
export struct ArkDataPage {
  @Local arkData: Array<ArkDataModel> = new Array<ArkDataModel>()
  @Local preferencesData: string = ''
  @Local inputData: string = ''
  private preferencesUtil: PreferencesUtil = new PreferencesUtil()

  aboutToAppear(): void {
    this.preferencesUtil.init()
    this.arkData.push({ modelName: 'Preferences' })
  }

  build() {
    Column({ space: 10 }) {
      // List({ space: 10 }) {
      //   ForEach(this.arkData, (item: ArkDataModel) => {
      //     ListItem() {
      //       Stack() {
      //         Text(`${item.modelName}`)
      //       }
      //       .width('100%')
      //       .height(50)
      //       .alignContent(Alignment.Center)
      //       .borderRadius(5)
      //       .shadow({
      //         radius: 10,
      //         color: $r('app.color.color_05')
      //       })
      //       .backgroundColor($r('app.color.white'))
      //     }.onClick(() => {
      //       if (item.modelName == 'Preferences') {
      //         this.preferencesUtil.putData('Preferences','Preferences')
      //       }
      //     })
      //   })
      // }
      // .width('100%')
      // .height('100%')
      // .alignListItem(ListItemAlign.Center)
      // .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
      // .backgroundColor(0x1a0a59f7)

      TextInput({ placeholder: '输入内容', text: `${this.inputData}` })
        .onChange((value: string, previewText: PreviewText, options: TextChangeOptions) => {
          this.inputData = value
          this.inputData = previewText.value
        })

      Button('存数据').onClick(() => {
        this.preferencesUtil.putData('Preferences', 'Hello,World')
      })

      Button('取数据').onClick(() => {
        this.preferencesData = this.preferencesUtil.getData('Preferences') as string
      })

      Text(`${this.inputData}`).fontColor($r('app.color.black')).fontSize(12)

      Text(`${this.preferencesData}`).fontColor($r('app.color.black'))
    }
    .width('100%')
    .height('100%')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}