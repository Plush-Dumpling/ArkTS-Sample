/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/24
 * Email: lijt@eetrust.com
 */
const promise: Promise<number> = new Promise((resolve: Function, reject: Function) => {
  setTimeout(() => {
    const randomNumber: number = Math.random()
    if (randomNumber > 0.5) {
      resolve(randomNumber)
    } else {
      reject(new Error('Random number is too small'))
    }
  }, 1000)
})

promise.then((result: number) => {

}, (error: Error) => {

})