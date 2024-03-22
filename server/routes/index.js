var fs = require('fs')
var path = require('path')
var axios = require('axios')
var dayjs = require('dayjs')
var dotenv = require('dotenv')
var express = require('express')
var jwt = require('jsonwebtoken')
var formidable = require('formidable')

var router = express.Router()
var {callP} = require("../db/db")
var {clone,isN,formatJSON,arrayToExcel} = require("../util/util")

const SECRET_KEY = 'HOSO-PLATFORM-2024'
const UPLOAD_DIR = `${__dirname}/../upload`


dotenv.config()

const root = path.resolve(__dirname, '../')


const auth =(req, res, next)=> {
  const authHeader = req.headers['authorization']
  const token = authHeader && authHeader.split(' ')[1]

  // console.log(token)
  if (isN(token)) return res.sendStatus(401)
  jwt.verify(token, SECRET_KEY, (err, usr) => {
    if (err) return res.sendStatus(403)
    req.usr = usr
    // console.log('usr',usr)
    next()
  })
}



///////////////////////////////////////////////////
// ---------------  系統模塊API ----------------- //
///////////////////////////////////////////////////


// 用戶登錄
router.post('/login',async (req, res, next) =>{
  let params = req.body
  let sql = `CALL PROC_LOGIN(?)`
  let r = await callP(sql, params, res)
  if (r.length > 0) {
    let ret = clone(r[0])
    let token = jwt.sign(ret, SECRET_KEY)
    res.status(200).json({code:0, data: ret, token: token, msg: '登录成功'})
  } else {
    res.status(200).json({code:1, data: null, msg: '用户名或密码错误'})
  }
})

// 上傳文件
router.post('/upload', function(req, res,next) {
  const form = formidable({ uploadDir: `${__dirname}/../upload` });

  form.on('fileBegin', function(name, file) {
    const filename = file.originalFilename;
    const filepath =  file.filepath;
    const fileext = filename.slice(((filename.lastIndexOf(".") - 1) >>> 0) + 2);

    file.filepath = `upload/${dayjs().format('YYYYMMDDhhmmss')}.${fileext}`
  })

  form.parse(req, (err, fields, files) => {
    if (err) {
      next(err);
      return;
    }

    res.status(200).json({
      status: 200,
      success: true,
      msg: '文件上传成功',
      data: files.file.filepath
    })
  });
})




///////////////////////////////////////////////////
// ---------------  合同API ----------------- //
///////////////////////////////////////////////////


// 查詢合同
router.post('/queryContact', async (req, res, next) => {
  let params = req.body
  // console.log(params)
  let sql = `CALL PROC_QUERY_CONTACT(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})

// 查詢合同
router.post('/saveContact', async (req, res, next) => {
  let params = req.body
  console.log(params)
  let sql = `CALL PROC_SAVE_CONTACT(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})

// 删除合同
router.post('/delContact', async (req, res, next) => {
  let params = req.body
  console.log(params)
  let sql = `CALL PROC_DEL_CONTACT(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})


// 删除合同
router.post('/querySche', async (req, res, next) => {
  let params = req.body
  console.log(params)
  let sql = `CALL PROC_QUERY_SCHE(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})


// 删除合同
router.post('/saveScheItem', async (req, res, next) => {
  let params = req.body
  console.log(params)
  let sql = `CALL PROC_SAVE_SCHE_ITEM(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})


router.post('/finishScheItem', async (req, res, next) => {
  let params = req.body
  console.log(params)
  let sql = `CALL PROC_FINISH_SCHE_ITEM(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})

router.post('/finishContact', async (req, res, next) => {
  let params = req.body
  console.log(params)
  let sql = `CALL PROC_FINISH_CONTACT(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})




///////////////////////////////////////////////////
// ------------------  出入庫API ----------------- //
///////////////////////////////////////////////////

// 查詢出入庫
router.post('/queryUser', async (req, res, next) => {
  let params = req.body
  // console.log(params)
  let sql = `CALL PROC_QUERY_USER(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})

// 刪除出入庫
router.post('/delUser', async (req, res, next) => {
  let params = req.body
  // console.log(params)
  let sql = `CALL PROC_DEL_USER(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})

// 保存出入庫
router.post('/saveUser',auth, async (req, res, next) => {
  let params = req.body
  let {usr} = req.usr
  params.create_name = usr
  let sql = `CALL PROC_SAVE_USER(?)`
  let r = await callP(sql, params, res)
  res.status(200).json({ code: 0, data: r })
})





module.exports = router