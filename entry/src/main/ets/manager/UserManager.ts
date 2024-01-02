import UserModel from '../model/UserModel'
import constantUtil from '../utils/ConstantUtil'
import ConstantUtil from '../utils/ConstantUtil'
import { GlobalContext } from '../utils/GlobalContext'
import preferenceUtil from '../utils/PreferencesUtil'

/**
 * user管理
 */
class UserManager {

  saveUser(userModel: UserModel) {
    preferenceUtil.save(ConstantUtil.USERNAME,userModel.username)
    preferenceUtil.save(ConstantUtil.REAL_NAME,userModel.realname)
    preferenceUtil.save(ConstantUtil.COMPANY_UUID,userModel.company_uuid)
    preferenceUtil.save(ConstantUtil.USER_UUID,userModel.uuid)
    preferenceUtil.save(ConstantUtil.TOKEN,userModel.token)
    GlobalContext.getContext().setValue(constantUtil.TOKEN,userModel.token)
  }

}

const userManager = new UserManager()
export default userManager