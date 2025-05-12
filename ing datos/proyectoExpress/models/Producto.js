const { default: mongoose } = require('mongoose')
const monoose=require('mongoose')

const itemSchema=new mongoose.Schema({
    nombre:{type:String,require:true},
    descripcion:{type:String},
    creadoEn:{type:Date,default:Date.now()}
})
module.exports=mongoose.model('item',itemSchema)