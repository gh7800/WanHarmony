// API 响应的数据结构
export default class ApiResponse<T = any> {
  data: T;
  success: boolean;
  message: string;

  constructor(success : boolean,message : string) {
    if(!success){
      throw new Error(message)
    }
  }
}