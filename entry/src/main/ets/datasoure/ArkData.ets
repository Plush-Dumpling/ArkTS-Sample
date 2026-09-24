import { preferences, ValueType } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/23
 * Email: lijt@eetrust.com
 */
export class PreferencesUtil {
  private dataPreferences: preferences.Preferences | null = null

  init(): void {
    let context = AppStorage.get<common.UIAbilityContext>('appContext')
    this.dataPreferences =
      preferences.getPreferencesSync(context, { name: 'AppPreferences', storageType: preferences.StorageType.XML })
  }

  isStorageTypeSupported(): boolean {
    let isSupported = preferences.isStorageTypeSupported(preferences.StorageType.GSKV)
    console.debug(`isStorageTypeSupported`, isSupported)
    return isSupported
  }

  putData(key: string, value: preferences.ValueType) {
    this.dataPreferences?.putSync(key, value)
    this.dataPreferences?.flushSync()
  }

  getData(key: string): preferences.ValueType {
    let data = this.dataPreferences?.getSync(key, 'default')
    return data ?? 'default'
  }
}