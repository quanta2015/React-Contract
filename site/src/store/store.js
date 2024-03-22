import { makeAutoObservable } from 'mobx'
import { message } from 'antd'
import { get, post } from '@/util/net.js'
import * as urls from '@/constant/urls'


class Store {
  constructor() {
    makeAutoObservable(this);
  }

  user = null

  saveUser = (user) => {
    this.user = user
  }

  async post(url, params) {
    const r = await post(url, params)
    // console.log(r,'aaaa')
    if (r.code === 0) {
      return r
    } else {
      return null
      message.error(' 网络接口数据出错!')
    }
  }


  async get(url, params) {
    const r = await get(url, params)
    console.log(r)
    if (r.code === 0) {
      return r.data
    } else {
      return null
      message.error(' 网络接口数据出错!')
    }
  }


///////////////////////////////////////////////////
// ---------------  系統模塊API ----------------- //
///////////////////////////////////////////////////


  async login(params) {
    const r = await post(urls.API_LOGIN,params)
    if (r) {
      return r
    }else{
      return null
      message.error(' 网络接口数据出错!')
    }
  }

  // 上傳圖片
  async upload(params) {
    try {
      const r = await this.post(urls.API_UPLOAD, params);
      if ((r.status === 200) && (r.data.code === 0)) {
        return r.data.data.id
      }
      return r;
    } catch (error) {
      message.error('文件上传失败！')
      console.error('File upload error: ', error);
    }
  }


///////////////////////////////////////////////////
// ---------------  部品模塊API ----------------- //
///////////////////////////////////////////////////

  // 查詢合同
  async queryContact(params) {
    return await this.post(urls.API_QUERY_CONTACT, params)
  }

  // 保存合同
  async saveContract(params) {
    return await this.post(urls.API_SAVE_CONTACT, params)
  }

  // 删除合同
  async deleteContact(params) {
    return await this.post(urls.API_DEL_CONTACT, params)
  }


  // 查询进度
  async querySche(params) {
    return await this.post(urls.API_QUERY_SCHE, params)
  }

  // 保存进度元素
  async saveScheItem(params) {
    return await this.post(urls.API_SAVE_SCHE_ITEM, params)
  }


  // 完成进度元素
  async finishScheItem(params) {
    return await this.post(urls.API_FINISH_SCHE_ITEM, params)
  }


  // 完成合同
  async finishContact(params) {
    return await this.post(urls.API_FINISH_CONTACT, params)
  }

  



///////////////////////////////////////////////////
// ------------------  用戶API ----------------- //
///////////////////////////////////////////////////

  // 查詢在庫
  async queryUser(params) {
    return await this.post(urls.API_QUERY_USER, params)
  }
  // 刪除在庫
  async delUser(params) {
    return await this.post(urls.API_DEL_USER, params)
  }
  // 保存在庫
  async saveUser(params) {
    return await this.post(urls.API_SAVE_USER, params)
  }



}

export default new Store()