// API 响应的数据结构
export default class ApiResponse<T = any> {
  data: T;
  errorCode: number;
  errorMsg: string;

  constructor(errorCode,errorMsg) {
    if(errorCode != 0){
      throw new Error(errorMsg)
    }
  }
}