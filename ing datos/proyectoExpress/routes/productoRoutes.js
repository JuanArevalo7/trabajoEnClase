const express=require('express');
const router=express.Router();
const item=require("../models/producto")
//registrar un producto
router.post("/",async(req,res)=>{
    try{
        const item=new Item(req.body);
        await item.save();
        res.status(201).json(item)
    }
    catch(error){
        res.status(404).json({error: error.message});
    }
});

//consultar todos los productos
router.get("/",async(req,res)=>{
    try{
        const items=await Item.find();
        res.json(items)
    }
    catch(error){
        res.status(500).json({error: error.message});
    }
});
//consultar por ID
router.get("/:id",async(req,res)=>{
    try{
        const item=await Item.findByid(req.params.id);
        if(!item)return res.status(404).json({error:"producto no encontrado"});
        res.json(item)
    }
    catch(error){
        res.status(500).json({error: error.message});
    }
});
//modificar datos del producto
router.put("/id",async(req,res)=>{
    try{
        const items=await Item.findbyIdAndUpdate(req.params.id, req.body,{new:true});
        res.json(items)
    }
    catch(error){
        res.status(500).json({error: error.message});
    }
});
//eliminar un productoñ
router.delete("/:id",async(req,res)=>{
    try{
        const item=await Item.findByidAndDelete(req.params.id);
        if(!item)return res.status(404).json({error:"producto no encontrado"});
        res.json(item)
    }
    catch(error){
        res.status(500).json({error: error.message});
    }
});
module.exports=router;