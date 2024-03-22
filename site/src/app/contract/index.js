/* eslint-disable jsx-a11y/anchor-is-valid */
import React,{useEffect,useState,useRef} from 'react';
import {Table, Space, Spin, Button, Modal, message, Select, DatePicker, Empty} from 'antd'
import {  PlusCircleOutlined,RollbackOutlined, ExclamationCircleFilled,FileMarkdownOutlined,CheckOutlined,CloudDownloadOutlined,DeleteOutlined,BlockOutlined,ScheduleOutlined,EditOutlined } from '@ant-design/icons';
import cls from 'classnames'
import dayjs from 'dayjs'
import { useSearchParams } from 'react-router-dom';
import { observer,MobXProviderContext } from 'mobx-react'
import {API_SERVER} from '@/constant/apis'
import {json_contact,TYPE_LIST} from '@/constant/data'
import { useNavigate } from 'react-router-dom'
import {filterData,getKeyField,clone,getBase64, genQR,optF} from '@/util/fn'
import s from './index.module.less';
import {getColumnSearchProps} from '@/util/filter'

import FormMain from './FormMain'
import FormSche from './FormSche'

const { confirm } = Modal;



const Contract = () => {
  const { store } = React.useContext(MobXProviderContext)
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();


  const pid_params = searchParams.get('pid')
  const pid = pid_params===null?0:parseInt(pid_params)

  const [searchText, setSearchText] = useState('');
  const [searchedColumn, setSearchedColumn] = useState('');
  const inputRef = useRef(null);


  const [refresh,setRefresh] = useState(false)
  const [showForm,setShowForm] = useState(false)
  const [showSche,setShowSche] = useState(false)
  const [method, setMethod] = useState('Insert')
  const [loading, setLoading] = useState(false);
  const [ds, setDs] = useState(false);
  const [item,setItem]  = useState(null);

  console.log(pid,'mode')


  const doSearch = (selectedKeys, confirm, dataIndex) => {
    confirm();
    setSearchText(selectedKeys[0]);
    setSearchedColumn(dataIndex);
  };

  const doReset = (clearFilters, dataIndex, confirm) => {
    if (clearFilters) {
      clearFilters();
      setSearchText('');
      setSearchedColumn(dataIndex);
      confirm();
    }
  };

  const doNav =(e)=>{
    navigate(`?pid=${e.id}`)
  }

  const doReturn =()=>{
    navigate(`/`)
  }


  // 添加功能操作
  const col = json_contact.concat({
    title: '機能',
    width: 180,
    align: 'center',
    fixed: 'right',
    render: o => (
      <Space className={s.cell_fun}>
        {pid===0 && <Button type="primary" size='small' onClick={()=>doNav(o)} ><BlockOutlined />子项</Button>}
        <Button type="primary" size='small' onClick={()=>doSche(o)} ><ScheduleOutlined />进度</Button>
        <Button type="primary" size='small' onClick={()=>doEdit(o)} ><EditOutlined />编辑</Button>
        <Button type="primary" size='small' danger onClick={()=>showDelConfirm(o)}><DeleteOutlined />删除</Button>

        {o.status ===0 && 
        <Button type="primary" size='small' style={{background: '#0f843e'}}  onClick={()=>showFinishConfirm(o)}><CheckOutlined />完成合同</Button>}
      </Space>
    ),
  })
  // 數據查詢過濾
  col[2] = {...col[2],...getColumnSearchProps('code',doSearch,doReset,inputRef,searchedColumn,searchText)}
  col[3] = {...col[3],...getColumnSearchProps('name',doSearch,doReset,inputRef,searchedColumn,searchText)}
  col[4] = {...col[4], filters: optF(TYPE_LIST), onFilter: (value, record) => record['type'].indexOf(value) === 0 }
  col[5] = {...col[5],...getColumnSearchProps('custom',doSearch,doReset,inputRef,searchedColumn,searchText)}
  col[10] = {...col[10],...getColumnSearchProps('exe_person',doSearch,doReset,inputRef,searchedColumn,searchText)}
  col[11] = {...col[11],...getColumnSearchProps('man_person',doSearch,doReset,inputRef,searchedColumn,searchText)}


  const showDelConfirm = (e) => {
    confirm({
      title: '确认要删除记录?',
      icon: <ExclamationCircleFilled />,
      okType: 'danger',
      okText: '确 定',
      cancelText: '取 消',
      onOk() {
        doDel(e)
      },
    });
  };

  const showFinishConfirm = (e) => {
    confirm({
      title: '确认要完成记录?',
      icon: <ExclamationCircleFilled />,
      okType: 'danger',
      okText: '确 定',
      cancelText: '取 消',
      onOk() {
        doFinish(e)
      },
    });
  };


  
  // 完成合同
  const doFinish = (e)=>{
    // console.log(e)
    let params = { 
      id: e.id,
      pid,
    }
    setLoading(true)
    store.finishContact(params).then(r=>{
      setLoading(false)
      setDs(r.data)
    })
  }


  // 刪除數據
  const doDel = (e)=>{
    // console.log(e)
    let params = { 
      id: e.id,
      pid,
    }
    setLoading(true)
    store.deleteContact(params).then(r=>{
      setLoading(false)
      setDs(r.data)
    })
  }

  const doEdit=(e)=>{
    setItem(e)
    setMethod('update')
    setShowForm(true)
  }

  const doSche=(e)=>{
    setItem(e)
    setShowSche(true)
  }

  useEffect(() => {
    let params = { pid }
    setLoading(true)
    store.queryContact(params).then(r=>{
      setLoading(false)
      setDs(r.data)
      setRefresh(false)
      // console.log(r.data)
    })
  }, [refresh,pid]);


  const doAdd =()=>{
    setMethod('insert')
    setShowForm(true)
  }


  const doExport =()=>{
    // setLoading(true)
    // store.exportPart().then(r => {
    //   setLoading(false)
    //   window.open(`${API_SERVER}/${r.file}`, '_blank');
    //   message.info("导出成功！")
    // })
  }




  return (
    
    <div className={s.index} >
      <Spin spinning={loading}>
        <div className={s.main}>
          <div className={s.fun}>
            {pid !== 0 &&  <Button type="primary" icon={<RollbackOutlined />} onClick={()=>doReturn()}>返回</Button>}
            {pid ===0 && <span></span>}
            <Space>
              <Button type="primary" icon={<PlusCircleOutlined/>} danger onClick={()=>doAdd()}>新建合同</Button>
            </Space>
          </div>
          <Table dataSource={ds} columns={col} scroll={{ x: 1000 }} pagination={{ defaultPageSize: 6 }}/>
        </div>


       {showForm && <FormMain {...{col, item, method, setRefresh, setShowForm, setLoading, pid}}  />}

       {showSche && <FormSche {...{col, item, method, setRefresh, setShowSche, setLoading}}  />}

      </Spin >
    </div>
  )

}

export default  observer(Contract)