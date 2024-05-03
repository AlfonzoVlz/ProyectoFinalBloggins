import { Router } from "express";
import { admiUsuario, createUsuario, eliminarUsuario, update } from "../controller/controller.js";

const router = Router()

router.post('/api/usuario', createUsuario)

router.put('/api/usuario/:id', update)

router.delete('/api/usuario/:id', eliminarUsuario)

router.get('/admi/usuario', admiUsuario)

export default router