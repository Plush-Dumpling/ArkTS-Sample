import { HMRouter } from '@hadss/hmrouter';
import RouterPath from '../constants/RouterPath';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/29
 * Email: lijt@eetrust.com
 */
@HMRouter({ pageUrl: RouterPath.PROMISE_ASYNC_AWAIT })
@ComponentV2
export struct PromiseAsyncAwait {
  @Local message: string = 'Hello World'

  aboutToAppear(): void {
    console.info('aboutToAppear')
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(50).fontWeight(FontWeight.Bold).onClick(async () => {
          let res = await asyncFunction()
          console.info(`Result is:${res}`)
          this.message = 'success'
        })
      }.width('100%')
    }.height('100%')
  }
}

async function asyncFunction() {
  const result: string = await new Promise((resole: Function) => {
    setTimeout(() => {
      resole('hello,world')
    }, 3000)
  })
  console.info(result)
  return result
}