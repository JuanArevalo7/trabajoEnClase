const express=require('express')
const app=express();
const port=3000;
//RUTA PRINCIPAL 
app.get("/",(req,res)=>{
    res.send("hola mundo");
});
//iniciar servidor
app.listen(port,()=>{
    console.log(`servidor corriendo sobre https://localhost:${port}`)
}) 
