import axios, { AxiosError, AxiosInstance, AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import constantUtil from '../utils/ConstantUtil';
import { GlobalContext } from '../utils/GlobalContext';
import logUtil from '../utils/LogUtil';
import preferenceUtil from '../utils/PreferencesUtil';
import ApiResponse from './ApiRsponse';


// 创建一个自定义的 HTTP 客户端类
class Api {
  private axiosInstance: AxiosInstance;
  private token = GlobalContext.getContext().getValue(constantUtil.TOKEN);

  private baseUrl() {
    return 'http://xcoa.hwapp.site/'
  }

  constructor() {
    this.axiosInstance = axios.create({
      // 在这里可以添加自定义配置，如 baseURL、headers 等
      baseURL: this.baseUrl(),
      timeout: 3000,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + this.token
      },
    });

    // 添加请求拦截器
    this.axiosInstance.interceptors.request.use(
      config => {
        //可添加token等
        /*logUtil.error('token_' + this.token)
        if(this.token){
          config.headers.set('Authorization','Bearer '+this.token)
        }*/

        console.error("Request：", config.method + '__' + config.baseURL + config.url)

        if (config.params) {
          console.error('Request params：', JSON.stringify(config.params))
        }

        return config
      },
      error => {
        logUtil.error('拦截器_' + error)
        return Promise.reject(error)
      }
    );
  }

  // 发送 GET 请求
  public async get(url: string, params: Record<string, any> = {}): Promise<ApiResponse> {
    return await this.axiosInstance.get<ApiResponse>(url, { params })
      .then(response => {
        var apiResponse = this.handleResponse(response)
        if (apiResponse.success) {
          return apiResponse
        } else {
          //throw new Error(apiResponse.message)
          this.handleError(apiResponse.message)
        }
      })
      .catch(this.handleError)
  }

  // 发送 POST 请求
  public async post(url: string, params: Record<string, any> = {}): Promise<ApiResponse> {
    return await this.axiosInstance.post<ApiResponse>(url, null, {
      params: params
    })
      .then(response => {
        var apiResponse = this.handleResponse(response)
        if (apiResponse.success) {
          return apiResponse
        } else {
          this.handleError(apiResponse.message)
        }
      })
    .catch(this.handleError)
  }

  //取消请求
  public cancelRequest() {
    logUtil.error('取消')
    axios.CancelToken.source()
  }

  // 其他 HTTP 请求方法可以根据需要添加，如 put、delete 等

  // 处理响应拦截
  private handleResponse<T>(response: AxiosResponse<T> | null): T {
    // 检查响应对象是否存在
    console.error('response--：', JSON.stringify(response.data))

    if (response && response.data !== undefined && response.data !== null) {
      return response.data;
    } else {
      // 如果响应对象或响应体不存在，返回一个默认值或者抛出错误，根据需要调整
      //throw new Error('Invalid response or empty response body');

      this.handleError('Invalid response or empty response body')
    }
  }

  // 处理请求错误
  private handleError(error: any) {
    // 这里可以添加一些全局的错误处理逻辑
    // logUtil.error('请求错误__' + error)

    var msg = error;
    if (axios.isAxiosError(error)) {
      var response = error.response

      logUtil.error(JSON.stringify(response.data) + '___' + response.status)

      /*
      var status = response.status
      if (status >= 500 && status < 600) {
        msg = '服务器错误_' + status
      } else if (status == 401) {
        msg = '认证错误'
      } else if (status == 404) {
        msg = '参数错误404'
      } else {
        msg = JSON.stringify(error.response.data.message)
      }*/

      msg = error.response.data.message

    } else {
      msg = '其他错误___' + error
    }

    return Promise.reject(msg);
    // return new ApiResponse(false, null, msg)
  }
}

// 创建实例，这样你可以在应用的其他地方使用同一个实例
const api = new Api();

export default api;
