/* eslint-disable jsx-a11y/anchor-is-valid */
import React,{useEffect,useState,useRef} from 'react';
import {Input,  Space,  Form, Button, Row, Col, Select, Upload, DatePicker, InputNumber, Modal, message} from 'antd'
import { MinusCircleOutlined, PlusOutlined ,CloudUploadOutlined, DeleteOutlined} from '@ant-design/icons';
import {API_SERVER} from '@/constant/apis'
import { TYPE_LIST } from '@/constant/data'
import { observer,MobXProviderContext } from 'mobx-react'
import {filterData,clone,getBase64,opt} from '@/util/fn'
import dayjs from 'dayjs'
import s from './index.module.less';

const { TextArea } = Input
const formItemLayout = {
  labelCol: {
    md: { span: 6 },
  },
  wrapperCol: {
    md: { span: 6 },
  },
};


const FormMain = ({col, item, method,setRefresh, setShowForm,setLoading,pid}) => {
  const { store } = React.useContext(MobXProviderContext)
  console.log(item)
  
  if (item) {
    item.sign_date = dayjs(item?.sign_date);
  }
  
  const initBasic = method==='insert'?{}:{...item}


  



  // 保存修改數據
  const onFinish = (values) => {
    values.sign_date = dayjs(values.sign_date).format('YYYY-MM-DD')
    const params = {
      id: item?.id,
      pid,
      method,
      ...values,
    }
    // console.log(params)

    setLoading(true)
    store.saveContract(params).then(r=>{
      setLoading(false)
      setShowForm(false)
      setRefresh(true)
      message.info('保存成功')
    })
  };


  return (
    <div className={s.form}>
      <div className={s.wrap}>
        <Form 
          {...formItemLayout}
          initialValues={initBasic}
          onFinish={onFinish}
          >
          <div className={s.head}>
            <h1>基本信息</h1>
          </div>

          <Row gutter={16}>
            <Col span={12}>
              <Form.Item
                name="code"
                label="合同編號"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入合同編號' }]}
              >
                <Input />
              </Form.Item>
            </Col>
            <Col span={12}>
              <Form.Item
                name="name"
                label="合同名称"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入合同名称' }]}
              >
                <Input />
              </Form.Item>
            </Col>
          </Row>

          <Row gutter={16}>
            <Col span={12}>
              <Form.Item
                name="type"
                label="合同類型"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入合同類型' }]}
              >
                <Select options={opt(TYPE_LIST)}/>
              </Form.Item>
            </Col>
            <Col span={12}>
              <Form.Item
                name="custom"
                label="客戶"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入客戶' }]}
              >
                <Input/>
              </Form.Item>
            </Col>
          </Row>

          <Row gutter={16}>
            <Col span={12}>
              <Form.Item
                name="sign_date"
                label="簽訂日期"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入簽訂日期' }]}
              >
                <DatePicker  style={{ width: '100%' }}/>
              </Form.Item>
            </Col>
            <Col span={12}>
              <Form.Item
                name="money"
                label="合同金額"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入合同金額' }]}
              >
                <InputNumber style={{ width: '100%' }}/>
              </Form.Item>
            </Col>
          </Row>

          <Row gutter={16}>
            <Col span={12}>
              <Form.Item
                name="pay_method"
                label="支付方式"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入支付方式' }]}
              >
                <Input/>
              </Form.Item>
            </Col>
            <Col span={12}>
              <Form.Item
                name="war_period"
                label="質保期"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入質保期' }]}
              >
                <Input/>
              </Form.Item>
            </Col>
          </Row>


          <Row gutter={16}>
            <Col span={12}>
              <Form.Item
                name="exe_person"
                label="執行人員"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入執行人員' }]}
              >
                <Input/>
              </Form.Item>
            </Col>
            <Col span={12}>
              <Form.Item
                name="man_person"
                label="管理人員"
                labelCol={{ span: 6 }}
                wrapperCol={{ span: 18 }}
                rules={[{ required: true, message: '请输入管理人員' }]}
              >
                <Input/>
              </Form.Item>
            </Col>
          </Row>


          <Row gutter={16}>
            <Form.Item
              name="remark"
              label="合同情况提示说明"
              labelCol={{ span: 3 }}
              wrapperCol={{ span: 21 }}
              style={{ width: '100%' }}
            >
              <TextArea style={{ height: '100%' }}/> 
            </Form.Item>
          </Row>


          <div className={s.fun}>
            <Button type="default" style={{width:'120px'}} onClick={()=>setShowForm(false)} >取消</Button>  
            <Button type="primary" htmlType="submit" style={{width:'120px'}} >保存</Button>
          </div>
        </Form>
      </div>

    </div>
    
  )

}

export default  observer(FormMain)