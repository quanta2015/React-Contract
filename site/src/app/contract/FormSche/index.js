/* eslint-disable jsx-a11y/anchor-is-valid */
import React,{useEffect,useState,useRef} from 'react';
import {Input,  Space,  Form, Button, Row, Col, Select, Tag, Upload, Popover, DatePicker, InputNumber, Modal, message} from 'antd'
import { MinusCircleOutlined, PlusOutlined ,CloudUploadOutlined, ExclamationCircleFilled, CloseOutlined, FileMarkdownOutlined } from '@ant-design/icons';
import {API_SERVER} from '@/constant/apis'
import { TYPE_LIST } from '@/constant/data'
import { observer,MobXProviderContext } from 'mobx-react'
import {filterData,clone,getBase64,opt} from '@/util/fn'
import dayjs from 'dayjs'
import s from './index.module.less';
import icon_file from '@/img/file.svg'

const ImgCount = 6
const FileCount = 6
const { confirm } = Modal;

const { TextArea } = Input
const formItemLayout = {
  labelCol: {
    md: { span: 6 },
  },
  wrapperCol: {
    md: { span: 6 },
  },
};




const FormSche = ({col, item, method,setRefresh, setShowSche,setLoading}) => {
  const { store } = React.useContext(MobXProviderContext)
  console.log(item)
  




  const [ds, setDs] = useState([]);
  const [file, setFile] = useState([[],[],[],[],[],[],[],[],[],[],[],[]])
  const [imgs, setImgs] = useState([[],[],[],[],[],[],[],[],[],[],[],[]])
  const [proc,setProc] = useState(['','','','','','','','','','','',''])
  const [info,setInfo] = useState(['','','','','','','','','','','',''])

  const [previewOpen, setPreviewOpen] = useState(false);
  const [previewImage, setPreviewImage] = useState('');
  const [previewTitle, setPreviewTitle] = useState('');


  const [visible, setVisible] = useState(false);




  useEffect(() => {

    const params = {
      cid: item.id,
    }
    setLoading(true)
    store.querySche(params).then(r=>{
      setLoading(false)
      setDs(r.data)

      const initImgs = []
      const initFile = []
      const initProc = []
      const initInfo = []

      r.data.map(o=> {
        initImgs.push(JSON.parse(o.imgs))
        initFile.push(JSON.parse(o.file))
        initProc.push(o.proc)
        initInfo.push(o.info)
      })

      setImgs(initImgs)
      setFile(initFile)
      setProc(initProc)
      setInfo(initInfo)
      // setRefresh(false)
      // console.log(r.data)
    })
  }, []);


  const doPreview = async (url) => {
    setPreviewImage(url);
    setPreviewOpen(true);
  }


  

  const doUploadImg =({ fileList: newFileList },i,proc,list,type)=>{
    console.log(i,proc)

    newFileList.map(o=>{
      let filename = o.response?.data;
      if (!list[i].includes(filename)&&(filename!==undefined)) {
        list[i].push(filename);
      }
    })
    setImgs([...list])
    // saveFile(proc.id,list[i],type)
  }


  const doUploadFile =({ fileList: newFileList },i,proc,list,type)=>{
    console.log(i,proc)

    newFileList.map(o=>{
      let filename = o.response?.data;
      if (!list[i].includes(filename)&&(filename!==undefined)) {
        list[i].push(filename);
      }
    })
    setFile([...list])
    // saveFile(proc.id,list[i],type)
  }

  const doClose =()=>{
    setShowSche(false)
    setRefresh(true)
  }


  const doDelFile =(i,j,proc,type)=>{
    console.log(proc)
    if (type==='imgs') {
      imgs[i].splice(j,1)
      setImgs([...imgs])
      // saveFile(proc.id,imgs[i],type)
    }else{
      file[i].splice(j,1)
      setFile([...file])
      // saveFile(proc.id,file[i],type)
    }
  }

  const doChgProc=(e,i)=>{
    const val = e.currentTarget.value
    proc[i] = val
    setProc([...proc])
  }

  const doChgInfo=(e,i)=>{
    const val = e.currentTarget.value
    info[i] = val
    setInfo([...info])
  }


  const doSaveScheItem = (o,i)=>{
    const params  = {
      id: o.id,
      file: file[i],
      imgs: imgs[i],
      proc: proc[i]??'',
      info: info[i]??'',
      // file,
      // type,
    }
    setLoading(true)
    store.saveScheItem(params).then(r=>{
      setLoading(false)
      message.info('保存附件成功')
    })
  }


  const doFinishConfirm = (o,i,status) => {
    confirm({
      title: '确认完成计划?',
      icon: <ExclamationCircleFilled />,
      okType: 'danger',
      okText: '确 定',
      cancelText: '取 消',
      onOk() {
        doFinishScheItem(o,i,status)
      },
    });
  };

  const doFinishScheItem=(o,i,status)=>{
    const params  = {
      id: o.id,
      cid: item.id,
      status,
    }
    setLoading(true)
    store.finishScheItem(params).then(r=>{
      setLoading(false)
      
      setDs(r.data)
      message.info('该过程已经完成！')
    })
  }


  console.log(ds,'ds')


  return (
    <div className={s.form}>
      <div className={s.wrap}>
        <div className={s.hd}>
          <span>合同进度管理</span>
          <Button icon={<CloseOutlined />} onClick={doClose} ></Button>
        </div>

        <div className={s.tab}>
          <div className={s.item}>
            <div className={s.id}>编号</div>
            <div className={s.status}>状态</div>
            <div className={s.name}>名称</div>
            <div className={s.imgs}>图片附件</div>
            <div className={s.file}>文件附件</div>
            <div className={s.proc}>进度</div>
            <div className={s.remark}>说明</div>
            
            <div className={s.fun}>功能</div>
          </div>

          {ds.map((o,i)=>
            <div className={s.item} key={i}>
              <div className={s.id}>{i+1}</div>
              <div className={s.status}><Tag color={o.status===0?'#f50':'#87d068'}>{o.status===0?'未完成':'已完成'}</Tag></div>
              <div className={s.name}>{o.name}</div>
              <div className={s.imgs}>

                {imgs[i].length < ImgCount &&
                <Upload 
                  action = {`${API_SERVER}/upload`}
                  maxCount={1}
                  onChange={(e)=>doUploadImg(e,i,o,imgs,'imgs')} >
                  <Button icon={< CloudUploadOutlined/>}/> 
                </Upload>}

                {imgs[i].map((f,j)=> 
                  <div className={s.fileitem}  key={j}>
                    <i className={s.del} onClick={()=>doDelFile(i,j,o,'imgs')}></i>
                    <img src={`${API_SERVER}/${f}`} alt=""  key={j} onClick={()=>doPreview(`${API_SERVER}/${f}`)}/> 
                  </div>
                )}
              </div>
              <div className={s.file}>
                {file[i].length < FileCount &&
                <Upload 
                  action = {`${API_SERVER}/upload`}
                  maxCount={1}
                  onChange={(e)=>doUploadFile(e,i,o,file,'file')} >
                  <Button icon={< FileMarkdownOutlined/>}/> 
                </Upload>}

                {file[i].map((f,j)=> 
                  
                    <div className={s.fileitem} key={j}>
                      <code>{f.split('-')[1]}</code>
                      <i className={s.del} onClick={()=>doDelFile(i,j,o,'file')}></i>
                      <a href={`${API_SERVER}/${f}`} alt=""  key={j}><img src={icon_file} alt="" /></a> 
                    </div>
                )}
              </div>
              <div className={s.proc}>
                <Input value={o.proc} value={proc[i]} onChange={(e)=>doChgProc(e,i)}/>
              </div>
              <div className={s.remark}>
                <Input value={o.remark} value={info[i]} onChange={(e)=>doChgInfo(e,i)}/>
              </div>
              
              <div className={s.fun}>
                {o.status ===0 && 
                  <Button type="primary" size="small" style={{background: '#11a052'}} onClick={()=>doFinishConfirm(o,i,1)} >完成</Button>}

                {o.status ===1 && 
                  <Button type="primary" size="small" style={{background: '#666'}}  onClick={()=>doFinishConfirm(o,i,0)} >撤回</Button>}

                
                
                <Button type="primary" size="small" onClick={()=>doSaveScheItem(o,i)}>保存</Button>
              </div>
              
            </div>

            )}
        </div>
      </div>


      <Modal open={previewOpen} title={previewTitle} footer={null} onCancel={() => setPreviewOpen(false)}>
        <img alt="" style={{ width: '100%', }} src={previewImage} />
      </Modal>
    </div>
    
  )

}

export default  observer(FormSche)